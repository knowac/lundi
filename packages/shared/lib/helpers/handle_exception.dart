import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared/models/custom_error.dart';

/// handleException Method helper to handle errors
/// e - Exception to handle
/// return - CustomError
CustomError handleException(Exception e) {
  try {
    throw e;
  } on FirebaseAuthException catch (e) {
    return CustomError(
      code: e.code,
      message: e.message ?? 'Invalid credential',
      plugin: e.plugin,
    );
  } on FirebaseException catch (e) {
    return CustomError(
      code: e.code,
      message: e.message ?? 'Invalid credential',
      plugin: e.plugin,
    );
  } on Exception catch (e) {
    return CustomError(
      code: 'Exception',
      message: e.toString(),
      plugin: 'Unknown error',
    );
  }
}
