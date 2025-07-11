import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';

/// AppUser class
@freezed
abstract class AppUser with _$AppUser {
  /// AppUser constructor
  const factory AppUser({
    @Default('') String id,
    @Default('') String email,
    @Default('') String name,
  }) = _AppUser;

  /// Creates AppUser from json
  factory AppUser.fromJson(DocumentSnapshot appUserDoc) {
    final appUser = appUserDoc.data()! as Map<String, dynamic>;

    return AppUser(
      id: appUserDoc.id,
      email: appUser['email'] as String,
      name: appUser['name'] as String,
    );
  }
}
