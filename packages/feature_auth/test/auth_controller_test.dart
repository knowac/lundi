import 'package:feature_auth/presentation/providers/auth_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthController', () {
    test('can be instantiated', () {
      final controller = AuthController();
      expect(controller, isNotNull);
    });
  });
}
