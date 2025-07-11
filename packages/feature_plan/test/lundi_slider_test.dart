import 'package:feature_plan/presentation/widgets/lundi_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('LundiSlider renders', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: LundiSlider(label: '')),
      ),
    );
    expect(find.byType(LundiSlider), findsOneWidget);
  });
}
