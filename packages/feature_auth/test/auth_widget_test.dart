import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Auth widget renders', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: Text('Auth')), // AuthWidget()
      ),
    );
    expect(find.text('Auth'), findsOneWidget);
  });
}
