import 'dart:core';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_error.freezed.dart';

/// CustomError class
@freezed
abstract class CustomError extends Error with _$CustomError {
  /// CustomError constructor
  factory CustomError({
    @Default('') String code,
    @Default('') String message,
    @Default('') String plugin,
  }) = _CustomError;
  CustomError._();
}
