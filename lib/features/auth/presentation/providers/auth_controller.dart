import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../auth/data/repositories/auth_repository.dart';
import '../../../auth/domain/models/auth_state.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  AuthState build() {
    return const AuthState();
  }

  Future<void> signIn(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await ref.read(authRepositoryProvider.notifier).signInWithEmailAndPassword(email, password);
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
      await ref.read(authRepositoryProvider.notifier).createUserWithEmailAndPassword(email, password);
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
      await ref.read(authRepositoryProvider.notifier).signOut();
      state = state.copyWith(isAuthenticated: false, isLoading: false);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'An error occurred during sign out',
      );
    }
  }
}
