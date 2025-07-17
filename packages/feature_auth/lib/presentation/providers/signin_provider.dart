import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared/di/feature_auth/auth_repository.dart';

part 'signin_provider.g.dart';

@riverpod
class Signin extends _$Signin {
  Object? _key;
  @override
  FutureOr<void> build() {
    _key = Object();
    ref.onDispose(() => _key = null);
  }

  Future<void> signin({required String email, required String password}) async {
    state = const AsyncLoading();
    final key = _key;
    final newState = await AsyncValue.guard(() async {
      final authRepository = ref.read(sharedAuthRepositoryProvider);
      await authRepository.signin(email: email, password: password);
    });
    if (key == _key) {
      state = newState;
    }
  }
}
