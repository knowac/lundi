import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:feature_home/presentation/widgets/home_widget.dart'; // odkomentuj jeśli masz taki widget

void main() {
  testWidgets('Home widget renders', (WidgetTester tester) async {
    // Zamień na swój widget jeśli istnieje
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(body: Text('Home')), // HomeWidget()
    ));
    expect(find.text('Home'), findsOneWidget);
  });
}
