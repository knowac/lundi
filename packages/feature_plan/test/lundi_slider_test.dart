import 'package:feature_plan/presentation/widgets/lundi_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('LundiSlider renders', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: LundiSlider(label: '')),
      ),
    );
    expect(find.byType(LundiSlider), findsOneWidget);
  });
}
