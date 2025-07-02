import 'package:feature_auth/presentation/providers/auth_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'forgot_password_provider.g.dart';

@riverpod
class ForgotPassword extends _$ForgotPassword {
  Object? _key;

  @override
  FutureOr<void> build() async {
    _key = Object();
    ref.onDispose(() {
      _key = null;
    });
    return;
  }

  Future<void> resetPassword({required String email}) async {
    state = AsyncLoading();
    final key = _key;
    final newState = await AsyncValue.guard(() async {
      await ref.read(authRepositoryProvider).sendPasswordResetEmail(email);
    });
    if (key == _key) {
      state = newState;
    }
  }
}
