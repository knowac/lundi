import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared/di/feature_auth/auth_repository.dart';

part 'forgot_password_provider.g.dart';

@riverpod
class ForgotPassword extends _$ForgotPassword {
  Object? _key;

  @override
  FutureOr<void> build() {
    _key = Object();
    ref.onDispose(() {
      _key = null;
    });
  }

  Future<void> resetPassword({required String email}) async {
    state = const AsyncLoading();
    final key = _key;
    final newState = await AsyncValue.guard(() async {
      await ref
          .read(sharedAuthRepositoryProvider)
          .sendPasswordResetEmail(email);
    });
    if (key == _key) {
      state = newState;
    }
  }
}
