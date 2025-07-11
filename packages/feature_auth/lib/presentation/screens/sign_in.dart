import 'dart:async';

import 'package:fancy_password_field/fancy_password_field.dart';
import 'package:feature_auth/presentation/providers/signin_provider.dart';
import 'package:feature_auth/presentation/providers/signup_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared/config/route_names.dart';
import 'package:shared/generated/l10n.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _scrollController = ScrollController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var _isPasswordHidden = true;
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    _scrollController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
        .read(signinProvider.notifier)
        .signin(
          email: _emailController.text,
          password: _passwordController.text,
        );
    form.save();
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
                  S.of(context).settingsSignInTitle,
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
                    Validators.required(S.of(context).settingsAuthEmptyEmail),
                    Validators.email(S.of(context).settingsAuthInvalidEmail),
                  ]),
                  decoration: InputDecoration(
                    fillColor: Theme.of(context).colorScheme.onPrimary,
                    filled: true,
                    border: const OutlineInputBorder(gapPadding: 6),
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
                tag: 'settingsAuthPassword',
                child: FancyPasswordField(
                  controller: _passwordController,
                  validator: Validators.compose([
                    Validators.required(
                      S.of(context).settingsAuthEmptyPassword,
                    ),
                  ]),
                  validationRules: {
                    DigitValidationRule(),
                    UppercaseValidationRule(),
                    LowercaseValidationRule(),
                    SpecialCharacterValidationRule(),
                    MinAndMaxCharactersValidationRule(min: 6, max: 16),
                  },
                  validationRuleBuilder: (rules, value) {
                    if (value.isEmpty) {
                      return const SizedBox.shrink();
                    }
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: rules
                          .map(
                            (rule) => rule.validate(value)
                                ? Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.check,
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        rule.name,
                                        style: GoogleFonts.roboto(
                                          fontSize: 16,
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.primary,
                                        ),
                                      ),
                                    ],
                                  )
                                : Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.close,
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.error,
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        rule.name,
                                        style: GoogleFonts.roboto(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.error,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                          )
                          .toList(),
                    );
                  },
                  obscureText: _isPasswordHidden,
                  decoration: InputDecoration(
                    fillColor: Theme.of(context).colorScheme.onPrimary,
                    filled: true,
                    border: const OutlineInputBorder(gapPadding: 6),
                    labelText: S.of(context).settingsAuthPassword,
                    labelStyle: GoogleFonts.roboto().copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                    suffixIcon: IconButton(
                      color: Theme.of(context).colorScheme.primary,
                      onPressed: () {
                        setState(() {
                          _isPasswordHidden = !_isPasswordHidden;
                        });
                      },
                      icon: Icon(
                        _isPasswordHidden
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
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
                  style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Theme.of(context).colorScheme.primary,
                          Theme.of(context).colorScheme.tertiary,
                        ],
                        stops: const [0, 100],
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(80),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      child: Text(
                        textAlign: TextAlign.center,
                        signinState.maybeWhen(
                          orElse: () => S.of(context).settingsSignInButton,
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
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Hero(
                    tag: 'settingsAuthTextButton',
                    child: TextButton(
                      onPressed: () {
                        unawaited(
                          GoRouter.of(
                            context,
                          ).pushNamed(RouteNames.settingsSignUp),
                        );
                      },
                      child: Text.rich(
                        TextSpan(
                          text: S.of(context).settingsAuthSignInNoAccount,
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          children: [
                            TextSpan(
                              text: S.of(context).settingsAuthClickHere,
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
                  TextButton(
                    onPressed: () {
                      unawaited(
                        GoRouter.of(
                          context,
                        ).pushNamed(RouteNames.settingsForgotPassword),
                      );
                    },
                    child: Text.rich(
                      TextSpan(
                        text: S.of(context).settingsAuthSignInForgotPassword,
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        children: [
                          TextSpan(
                            text: S.of(context).settingsAuthClickHere,
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
