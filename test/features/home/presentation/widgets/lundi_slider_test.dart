import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lundi/widgets/lundi_slider.dart';

void main() {
  testWidgets('LundiSlider renders', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LundiSlider(
            label: '',
          ),
        ),
      ),
    );
    expect(find.byType(LundiSlider), findsOneWidget);
  });
}
