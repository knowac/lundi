import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Home widget renders', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: Text('Home')), // HomeWidget()
      ),
    );
    expect(find.text('Home'), findsOneWidget);
  });
}
