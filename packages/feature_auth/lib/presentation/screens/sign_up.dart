import 'package:fancy_password_field/fancy_password_field.dart';
import 'package:feature_auth/presentation/providers/signup_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared/config/route_names.dart';
import 'package:shared/generated/l10n.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _scrollController = ScrollController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordHidden = true;
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    _scrollController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
    await ref
        .read(signupProvider.notifier)
        .signup(
          name: _nameController.text,
          email: _emailController.text,
          password: _passwordController.text,
        );
    form.save();
  }

  @override
  Widget build(BuildContext context) {
    print("SignUp");
    ref.listen(signupProvider, (prev, next) {
      next.whenOrNull(
        error: (error, st) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Error"),
                content: Text("Error has occurred: $error"),
              );
            },
          );
        },
      );
    });
    final signupState = ref.watch(signupProvider);

    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 130, bottom: 130),
      controller: _scrollController,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
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
                  S.of(context).settingsSignUpTitle,
                  style: GoogleFonts.agdasima().copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextFormField(
                controller: _nameController,
                validator: Validators.compose([
                  Validators.required(S.of(context).settingsAuthEmptyName),
                  Validators.minLength(
                    6,
                    S.of(context).settingsAuthNameMinLength,
                  ),
                  Validators.maxLength(
                    16,
                    S.of(context).settingsAuthNameMaxLength,
                  ),
                ]),
                decoration: InputDecoration(
                  fillColor: Theme.of(context).colorScheme.onPrimary,
                  filled: true,
                  border: OutlineInputBorder(gapPadding: 6),
                  labelText: S.of(context).settingsAuthName,
                  labelStyle: GoogleFonts.roboto().copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
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
                    border: OutlineInputBorder(gapPadding: 6),
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: rules
                          .map(
                            (rule) => rule.validate(value)
                                ? Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
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
                                    mainAxisSize: MainAxisSize.max,
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
                    border: OutlineInputBorder(gapPadding: 6),
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
                  onPressed: signupState.maybeWhen(
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
                        stops: [0, 100],
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
                        signupState.maybeWhen(
                          orElse: () => S.of(context).settingsSignUpButton,
                          loading: () => S.of(context).settingsSignUpLoading,
                        ),
                        style: GoogleFonts.roboto().copyWith(
                          color: Theme.of(context).colorScheme.surface,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Hero(
                tag: 'settingsAuthTextButton',
                child: TextButton(
                  onPressed: () {
                    GoRouter.of(context).pushNamed(RouteNames.settingsSignIn);
                  },
                  child: Text.rich(
                    TextSpan(
                      text: S.of(context).settingsAuthSignOutAlreadySignedUp,
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
            ],
          ),
        ),
      ),
    );
  }
}
