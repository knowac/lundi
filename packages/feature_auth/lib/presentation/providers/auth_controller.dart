import 'package:feature_auth/domain/models/auth_state.dart';
import 'package:feature_auth/presentation/providers/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  AuthState build() => const AuthState();

  Future<void> signIn(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await ref
          .read(authProvider.notifier)
          .signInWithEmailAndPassword(email, password);
      state = state.copyWith(isAuthenticated: true, isLoading: false);
    } on FirebaseAuthException catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.message ?? 'An error occurred during sign in',
      );
    }
  }

  Future<void> signUp(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await ref
          .read(authProvider.notifier)
          .createUserWithEmailAndPassword(email, password);
      state = state.copyWith(isAuthenticated: true, isLoading: false);
    } on FirebaseAuthException catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.message ?? 'An error occurred during sign up',
      );
    }
  }

  Future<void> signOut() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await ref.read(authProvider.notifier).signOut();
      state = state.copyWith(isAuthenticated: false, isLoading: false);
    } on Exception {
      state = state.copyWith(
        isLoading: false,
        error: 'An error occurred during sign out',
      );
    }
  }
}
