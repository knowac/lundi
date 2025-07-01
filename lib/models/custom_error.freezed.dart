// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomError {
  String get code;
  String get message;
  String get plugin;

  /// Create a copy of CustomError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomErrorCopyWith<CustomError> get copyWith =>
      _$CustomErrorCopyWithImpl<CustomError>(this as CustomError, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomError &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.plugin, plugin) || other.plugin == plugin));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, message, plugin);

  @override
  String toString() {
    return 'CustomError(code: $code, message: $message, plugin: $plugin)';
  }
}

/// @nodoc
abstract mixin class $CustomErrorCopyWith<$Res> {
  factory $CustomErrorCopyWith(
          CustomError value, $Res Function(CustomError) _then) =
      _$CustomErrorCopyWithImpl;
  @useResult
  $Res call({String code, String message, String plugin});
}

/// @nodoc
class _$CustomErrorCopyWithImpl<$Res> implements $CustomErrorCopyWith<$Res> {
  _$CustomErrorCopyWithImpl(this._self, this._then);

  final CustomError _self;
  final $Res Function(CustomError) _then;

  /// Create a copy of CustomError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? plugin = null,
  }) {
    return _then(_self.copyWith(
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      plugin: null == plugin
          ? _self.plugin
          : plugin // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _CustomError implements CustomError {
  const _CustomError({this.code = '', this.message = '', this.plugin = ''});

  @override
  @JsonKey()
  final String code;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final String plugin;

  /// Create a copy of CustomError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CustomErrorCopyWith<_CustomError> get copyWith =>
      __$CustomErrorCopyWithImpl<_CustomError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomError &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.plugin, plugin) || other.plugin == plugin));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, message, plugin);

  @override
  String toString() {
    return 'CustomError(code: $code, message: $message, plugin: $plugin)';
  }
}

/// @nodoc
abstract mixin class _$CustomErrorCopyWith<$Res>
    implements $CustomErrorCopyWith<$Res> {
  factory _$CustomErrorCopyWith(
          _CustomError value, $Res Function(_CustomError) _then) =
      __$CustomErrorCopyWithImpl;
  @override
  @useResult
  $Res call({String code, String message, String plugin});
}

/// @nodoc
class __$CustomErrorCopyWithImpl<$Res> implements _$CustomErrorCopyWith<$Res> {
  __$CustomErrorCopyWithImpl(this._self, this._then);

  final _CustomError _self;
  final $Res Function(_CustomError) _then;

  /// Create a copy of CustomError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? plugin = null,
  }) {
    return _then(_CustomError(
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      plugin: null == plugin
          ? _self.plugin
          : plugin // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
