import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';

@freezed
abstract class AppUser with _$AppUser {
  const factory AppUser({
    @Default('') String id,
    @Default('') String email,
    @Default('') String name,
  }) = _AppUser;
  factory AppUser.fromJson(DocumentSnapshot appUserDoc) {
    final appUser = appUserDoc.data() as Map<String, dynamic>;

    return AppUser(
      id: appUserDoc.id,
      email: appUser['email'],
      name: appUser['name'],
    );
  }
}
