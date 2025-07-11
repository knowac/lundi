import 'dart:async';

import 'package:feature_auth/presentation/providers/forgot_password_provider.dart';
import 'package:feature_auth/presentation/providers/signin_provider.dart';
import 'package:feature_auth/presentation/providers/signup_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared/generated/l10n.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class ForgotPassword extends ConsumerStatefulWidget {
  const ForgotPassword({super.key});

  @override
  ConsumerState<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends ConsumerState<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  final _scrollController = ScrollController();
  final _emailController = TextEditingController();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  bool _emailSent = false;

  @override
  void dispose() {
    _scrollController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    setState(() {
      _autovalidateMode = AutovalidateMode.always;
    });

    final form = _formKey.currentState;
    if (form == null || !form.validate()) {
      return;
    }
    await ref
        .read(forgotPasswordProvider.notifier)
        .resetPassword(email: _emailController.text);
    form.save();
    setState(() {
      _emailSent = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(signupProvider, (prev, next) {
      next.whenOrNull(
        error: (error, st) {
          unawaited(
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Error'),
                content: Text('Error has occurred: $error'),
              ),
            ),
          );
        },
      );
    });
    final signinState = ref.watch(signinProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 130, bottom: 130),
      controller: _scrollController,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          autovalidateMode: _autovalidateMode,
          key: _formKey,
          child: Column(
            spacing: 16,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'settingsAuthTitle',
                child: Text(
                  S.of(context).settingsAuthForgotPasswordTitle,
                  style: GoogleFonts.agdasima().copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (!_emailSent) ...[
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: S.of(context).settingsAuthEmail,
                  ),
                  validator: Validators.compose([
                    Validators.required(S.of(context).settingsAuthEmptyEmail),
                    Validators.email(S.of(context).settingsAuthInvalidEmail),
                  ]),
                ),
                FilledButton(
                  onPressed: signinState.isLoading ? null : _submit,
                  child: signinState.isLoading
                      ? const CircularProgressIndicator()
                      : Text(S.of(context).settingsAuthSignInForgotPassword),
                ),
              ] else ...[
                Text(
                  S.of(context).settingsAuthForgotPasswordExplanation,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
