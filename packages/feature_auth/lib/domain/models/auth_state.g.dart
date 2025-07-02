// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthState _$AuthStateFromJson(Map<String, dynamic> json) => _AuthState(
  isAuthenticated: json['isAuthenticated'] as bool? ?? false,
  isLoading: json['isLoading'] as bool? ?? false,
  error: json['error'] as String?,
);

Map<String, dynamic> _$AuthStateToJson(_AuthState instance) =>
    <String, dynamic>{
      'isAuthenticated': instance.isAuthenticated,
      'isLoading': instance.isLoading,
      'error': instance.error,
    };
