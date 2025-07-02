import 'package:feature_plan/domain/models/plan_item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PlanItem', () {
    test('should support value equality', () {
      final now = DateTime.now();
      final a = PlanItem(date: now, place: 'A');
      final b = PlanItem(date: now, place: 'A');
      expect(a, equals(b));
    });
  });
}
