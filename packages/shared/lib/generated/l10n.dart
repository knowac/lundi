// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `LUNDI`
  String get appName {
    return Intl.message('LUNDI', name: 'appName', desc: '', args: []);
  }

  /// `Welcome in Lundi!`
  String get homeMessageTitle {
    return Intl.message(
      'Welcome in Lundi!',
      name: 'homeMessageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Lundi is the app designed to help you organize the trip best suited to your needs. Just fill the form and app will automatically find the most interesting route.\nYour data is completely anonymous, not shared with anyone and stored only on this device.`
  String get homeMessageBody {
    return Intl.message(
      'Lundi is the app designed to help you organize the trip best suited to your needs. Just fill the form and app will automatically find the most interesting route.\nYour data is completely anonymous, not shared with anyone and stored only on this device.',
      name: 'homeMessageBody',
      desc: '',
      args: [],
    );
  }

  /// `TAP TO BEGIN`
  String get homeMessageButton {
    return Intl.message(
      'TAP TO BEGIN',
      name: 'homeMessageButton',
      desc: '',
      args: [],
    );
  }

  /// `Nearest trips:`
  String get homeNearestTrip {
    return Intl.message(
      'Nearest trips:',
      name: 'homeNearestTrip',
      desc: '',
      args: [],
    );
  }

  /// `Fill the form`
  String get planFormTitle {
    return Intl.message(
      'Fill the form',
      name: 'planFormTitle',
      desc: '',
      args: [],
    );
  }

  /// `Fill the form with the initial data about your trip. We will try to create a trip best suited to your needs.`
  String get planFormExplanation {
    return Intl.message(
      'Fill the form with the initial data about your trip. We will try to create a trip best suited to your needs.',
      name: 'planFormExplanation',
      desc: '',
      args: [],
    );
  }

  /// `In a scale from 1 to 5 (where 1 is not interested at all and 5 is very interested) type how much you are interested in those attractions:`
  String get planFormInterestsExplanation {
    return Intl.message(
      'In a scale from 1 to 5 (where 1 is not interested at all and 5 is very interested) type how much you are interested in those attractions:',
      name: 'planFormInterestsExplanation',
      desc: '',
      args: [],
    );
  }

  /// `Nature`
  String get planFormInterestsNature {
    return Intl.message(
      'Nature',
      name: 'planFormInterestsNature',
      desc: '',
      args: [],
    );
  }

  /// `Culture`
  String get planFormInterestsCulture {
    return Intl.message(
      'Culture',
      name: 'planFormInterestsCulture',
      desc: '',
      args: [],
    );
  }

  /// `Cities`
  String get planFormInterestsCities {
    return Intl.message(
      'Cities',
      name: 'planFormInterestsCities',
      desc: '',
      args: [],
    );
  }

  /// `Food`
  String get planFormInterestsFood {
    return Intl.message(
      'Food',
      name: 'planFormInterestsFood',
      desc: '',
      args: [],
    );
  }

  /// `dd/MM/yyyy`
  String get planDateFormat {
    return Intl.message(
      'dd/MM/yyyy',
      name: 'planDateFormat',
      desc: '',
      args: [],
    );
  }

  /// `DD/MM/YYYY`
  String get planDateFormatString {
    return Intl.message(
      'DD/MM/YYYY',
      name: 'planDateFormatString',
      desc: '',
      args: [],
    );
  }

  /// `Date cannot be empty`
  String get planDateValidationEmpty {
    return Intl.message(
      'Date cannot be empty',
      name: 'planDateValidationEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Location cannot be empty`
  String get planLocationValidationEmpty {
    return Intl.message(
      'Location cannot be empty',
      name: 'planLocationValidationEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Calculate route`
  String get planCalculateRouteButton {
    return Intl.message(
      'Calculate route',
      name: 'planCalculateRouteButton',
      desc: '',
      args: [],
    );
  }

  /// `Edit trip`
  String get editTitle {
    return Intl.message('Edit trip', name: 'editTitle', desc: '', args: []);
  }

  /// `Here you can modify your trip plan`
  String get editExplanation {
    return Intl.message(
      'Here you can modify your trip plan',
      name: 'editExplanation',
      desc: '',
      args: [],
    );
  }

  /// `Nothing to show yet`
  String get editNothingToShow {
    return Intl.message(
      'Nothing to show yet',
      name: 'editNothingToShow',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get settingsSignUp {
    return Intl.message('Sign Up', name: 'settingsSignUp', desc: '', args: []);
  }

  /// `Sign In`
  String get settingsSignIn {
    return Intl.message('Sign In', name: 'settingsSignIn', desc: '', args: []);
  }

  /// `Sign Out`
  String get settingsSignOut {
    return Intl.message(
      'Sign Out',
      name: 'settingsSignOut',
      desc: '',
      args: [],
    );
  }

  /// `Export trip`
  String get settingsExport {
    return Intl.message(
      'Export trip',
      name: 'settingsExport',
      desc: '',
      args: [],
    );
  }

  /// `License`
  String get settingsLicense {
    return Intl.message('License', name: 'settingsLicense', desc: '', args: []);
  }

  /// `Clear data`
  String get settingsClearData {
    return Intl.message(
      'Clear data',
      name: 'settingsClearData',
      desc: '',
      args: [],
    );
  }

  /// `Privacy policy`
  String get settingsPrivacyPolicy {
    return Intl.message(
      'Privacy policy',
      name: 'settingsPrivacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get settingsSignUpTitle {
    return Intl.message(
      'Sign up',
      name: 'settingsSignUpTitle',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get settingsSignUpButton {
    return Intl.message(
      'Sign up',
      name: 'settingsSignUpButton',
      desc: '',
      args: [],
    );
  }

  /// `Registering...`
  String get settingsSignUpLoading {
    return Intl.message(
      'Registering...',
      name: 'settingsSignUpLoading',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get settingsSignInTitle {
    return Intl.message(
      'Sign in',
      name: 'settingsSignInTitle',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get settingsSignInButton {
    return Intl.message(
      'Sign in',
      name: 'settingsSignInButton',
      desc: '',
      args: [],
    );
  }

  /// `Logging in...`
  String get settingsSignInLoading {
    return Intl.message(
      'Logging in...',
      name: 'settingsSignInLoading',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get settingsAuthName {
    return Intl.message('Name', name: 'settingsAuthName', desc: '', args: []);
  }

  /// `Email`
  String get settingsAuthEmail {
    return Intl.message('Email', name: 'settingsAuthEmail', desc: '', args: []);
  }

  /// `Password`
  String get settingsAuthPassword {
    return Intl.message(
      'Password',
      name: 'settingsAuthPassword',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email`
  String get settingsAuthInvalidEmail {
    return Intl.message(
      'Invalid email',
      name: 'settingsAuthInvalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Email cannot be empty`
  String get settingsAuthEmptyEmail {
    return Intl.message(
      'Email cannot be empty',
      name: 'settingsAuthEmptyEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password cannot be empty`
  String get settingsAuthEmptyPassword {
    return Intl.message(
      'Password cannot be empty',
      name: 'settingsAuthEmptyPassword',
      desc: '',
      args: [],
    );
  }

  /// `Name cannot be empty`
  String get settingsAuthEmptyName {
    return Intl.message(
      'Name cannot be empty',
      name: 'settingsAuthEmptyName',
      desc: '',
      args: [],
    );
  }

  /// `Name must be longer ior equal to 6 characters`
  String get settingsAuthNameMinLength {
    return Intl.message(
      'Name must be longer ior equal to 6 characters',
      name: 'settingsAuthNameMinLength',
      desc: '',
      args: [],
    );
  }

  /// `Name must be shorter or equal to 16 characters`
  String get settingsAuthNameMaxLength {
    return Intl.message(
      'Name must be shorter or equal to 16 characters',
      name: 'settingsAuthNameMaxLength',
      desc: '',
      args: [],
    );
  }

  /// `You have no account? `
  String get settingsAuthSignInNoAccount {
    return Intl.message(
      'You have no account? ',
      name: 'settingsAuthSignInNoAccount',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password? `
  String get settingsAuthSignInForgotPassword {
    return Intl.message(
      'Forgot password? ',
      name: 'settingsAuthSignInForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Already signed up? `
  String get settingsAuthSignOutAlreadySignedUp {
    return Intl.message(
      'Already signed up? ',
      name: 'settingsAuthSignOutAlreadySignedUp',
      desc: '',
      args: [],
    );
  }

  /// `Click here!`
  String get settingsAuthClickHere {
    return Intl.message(
      'Click here!',
      name: 'settingsAuthClickHere',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password`
  String get settingsAuthForgotPasswordTitle {
    return Intl.message(
      'Forgot password',
      name: 'settingsAuthForgotPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Send reset email`
  String get settingsAuthForgotPasswordButton {
    return Intl.message(
      'Send reset email',
      name: 'settingsAuthForgotPasswordButton',
      desc: '',
      args: [],
    );
  }

  /// `Check your email. You should receive the email with the link for password reset.`
  String get settingsAuthForgotPasswordExplanation {
    return Intl.message(
      'Check your email. You should receive the email with the link for password reset.',
      name: 'settingsAuthForgotPasswordExplanation',
      desc: '',
      args: [],
    );
  }

  /// `Not received email in few minutes? `
  String get settingsAuthForgotPasswordSendAgainLabel {
    return Intl.message(
      'Not received email in few minutes? ',
      name: 'settingsAuthForgotPasswordSendAgainLabel',
      desc: '',
      args: [],
    );
  }

  /// `Send email again!`
  String get settingsAuthForgotPasswordSendAgainButton {
    return Intl.message(
      'Send email again!',
      name: 'settingsAuthForgotPasswordSendAgainButton',
      desc: '',
      args: [],
    );
  }

  /// `By pressing 'Clear data' button i acknowledge all data related to the app stored on this device will be deleted.`
  String get settingsClearDataExplanation {
    return Intl.message(
      'By pressing \'Clear data\' button i acknowledge all data related to the app stored on this device will be deleted.',
      name: 'settingsClearDataExplanation',
      desc: '',
      args: [],
    );
  }

  /// `Clear data`
  String get settingsClearDataButton {
    return Intl.message(
      'Clear data',
      name: 'settingsClearDataButton',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
