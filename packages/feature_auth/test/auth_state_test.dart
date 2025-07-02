import 'package:flutter_test/flutter_test.dart';
import 'package:feature_auth/domain/models/auth_state.dart';

void main() {
  group('AuthState', () {
    test('should support value equality', () {
      const a = AuthState(isAuthenticated: true);
      const b = AuthState(isAuthenticated: true);
      expect(a, equals(b));
    });

    test('should have correct default values', () {
      const state = AuthState();
      expect(state.isAuthenticated, false);
      expect(state.isLoading, false);
      expect(state.error, isNull);
    });
  });
}
