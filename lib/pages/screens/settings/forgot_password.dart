import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lundi/generated/l10n.dart';
import 'package:lundi/providers/auth/forgot_password_provider.dart';
import 'package:lundi/providers/signin_provider.dart';
import 'package:lundi/providers/signup_provider.dart';
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

  void _submit() async {
    setState(() {
      _autovalidateMode = AutovalidateMode.always;
    });

    final form = _formKey.currentState;
    if (form == null || !form.validate()) {
      return;
    }
    await ref.read(forgotPasswordProvider.notifier).resetPassword(
          email: _emailController.text,
        );
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
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  "Error",
                ),
                content: Text(
                  "Error has occurred: $error",
                ),
              );
            },
          );
        },
      );
    });
    final signinState = ref.watch(signinProvider);

    return SingleChildScrollView(
      padding: EdgeInsets.only(
        top: 130,
        bottom: 130,
      ),
      controller: _scrollController,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Form(
          autovalidateMode: _autovalidateMode,
          key: _formKey,
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.center,
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
              Hero(
                tag: 'settingsAuthEmail',
                child: TextFormField(
                  controller: _emailController,
                  validator: Validators.compose([
                    Validators.required(
                      S.of(context).settingsAuthEmptyEmail,
                    ),
                    Validators.email(
                      S.of(context).settingsAuthInvalidEmail,
                    ),
                  ]),
                  decoration: InputDecoration(
                    fillColor: Theme.of(context).colorScheme.onPrimary,
                    filled: true,
                    border: OutlineInputBorder(
                      gapPadding: 6,
                    ),
                    labelText: S.of(context).settingsAuthEmail,
                    labelStyle: GoogleFonts.roboto().copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Hero(
                tag: 'settingsAuthButton',
                child: ElevatedButton(
                  onPressed: signinState.maybeWhen(
                    loading: () => null,
                    orElse: () => _submit,
                  ),
                  clipBehavior: Clip.antiAlias,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Theme.of(context).colorScheme.primary,
                          Theme.of(context).colorScheme.tertiary,
                        ],
                        stops: [
                          0,
                          100,
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(80.0)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      child: Text(
                        textAlign: TextAlign.center,
                        signinState.maybeWhen(
                          orElse: () =>
                              S.of(context).settingsAuthForgotPasswordButton,
                          loading: () => S.of(context).settingsSignInLoading,
                        ),
                        style: GoogleFonts.roboto().copyWith(
                          color: Theme.of(context).colorScheme.surface,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (_emailSent)
                Text(
                  S.of(context).settingsAuthForgotPasswordExplanation,
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              Hero(
                tag: 'settingsAuthTextButton',
                child: TextButton(
                  onPressed: _submit,
                  child: Text.rich(
                    TextSpan(
                      text: S
                          .of(context)
                          .settingsAuthForgotPasswordSendAgainLabel,
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      children: [
                        TextSpan(
                          text: S
                              .of(context)
                              .settingsAuthForgotPasswordSendAgainButton,
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
