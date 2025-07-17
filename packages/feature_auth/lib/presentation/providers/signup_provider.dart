import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared/di/feature_auth/auth_repository.dart';

part 'signup_provider.g.dart';

@riverpod
class Signup extends _$Signup {
  Object? _key;
  @override
  FutureOr<void> build() {
    _key = Object();
    ref.onDispose(() => _key = null);
  }

  Future<void> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    final key = _key;
    final newState = await AsyncValue.guard(() async {
      final authRepository = ref.read(sharedAuthRepositoryProvider);
      await authRepository.signup(name: name, email: email, password: password);
    });
    if (key == _key) {
      state = newState;
    }
  }
}
