import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared/constants/firebase_constants.dart';
import 'package:shared/helpers/handle_exception.dart';

class AuthRepository {
  User? get currentUser => kFbAuth.currentUser;

  Future<void> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await kFbAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final signedUser = userCredential.user!;
      await kUsersCollection.doc(signedUser.uid).set({
        'name': name,
        'email': email,
      });
    } on Exception catch (e) {
      throw handleException(e);
    }
  }

  Future<void> signin({required String email, required String password}) async {
    try {
      await kFbAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on Exception catch (e) {
      throw handleException(e);
    }
  }

  Future<void> signout() async {
    try {
      await kFbAuth.signOut();
    } on Exception catch (e) {
      throw handleException(e);
    }
  }

  Future<void> changePassword(String password) async {
    try {
      await currentUser!.updatePassword(password);
    } on Exception catch (e) {
      throw handleException(e);
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await kFbAuth.sendPasswordResetEmail(email: email);
    } on Exception catch (e) {
      throw handleException(e);
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      await currentUser!.sendEmailVerification();
    } on Exception catch (e) {
      throw handleException(e);
    }
  }

  Future<void> reloadUser() async {
    try {
      await currentUser!.reload();
    } on Exception catch (e) {
      throw handleException(e);
    }
  }

  Future<void> reauthenticate(String email, String password) async {
    try {
      await currentUser!.reauthenticateWithCredential(
        EmailAuthProvider.credential(email: email, password: password),
      );
    } on Exception catch (e) {
      throw handleException(e);
    }
  }
}
