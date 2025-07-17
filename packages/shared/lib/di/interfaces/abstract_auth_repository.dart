abstract class AbstractAuthRepository {
  Future<void> signup({
    required String name,
    required String email,
    required String password,
  });

  Future<void> signin({required String email, required String password});

  Future<void> signout();

  Future<void> changePassword(String password);

  Future<void> sendPasswordResetEmail(String email);

  Future<void> sendEmailVerification();

  Future<void> reloadUser();

  Future<void> reauthenticate(String email, String password);
}
