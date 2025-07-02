import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:feature_plan/presentation/widgets/plan_widget.dart'; // odkomentuj jeśli masz taki widget

void main() {
  testWidgets('Plan widget renders', (WidgetTester tester) async {
    // Zamień na swój widget jeśli istnieje
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(body: Text('Plan')), // PlanWidget()
    ));
    expect(find.text('Plan'), findsOneWidget);
  });
}
