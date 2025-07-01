import 'package:lundi/providers/auth_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signup_provider.g.dart';

@riverpod
class Signup extends _$Signup {
  Object? _key;
  @override
  FutureOr<void> build() async {
    _key = Object();
    ref.onDispose(() => _key = null);
    return;
  }

  Future<void> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    state = AsyncLoading();
    final key = _key;
    final newState = await AsyncValue.guard(() async {
      final authRepository = ref.read(authRepositoryProvider);
      await authRepository.signup(
        name: name,
        email: email,
        password: password,
      );
    });
    if (key == _key) {
      state = newState;
    }
  }
}
