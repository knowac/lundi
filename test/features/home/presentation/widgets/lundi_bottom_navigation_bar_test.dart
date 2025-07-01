import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lundi/widgets/lundi_bottom_navigation_bar.dart';

void main() {
  testWidgets('LundiBottomNavigationBar renders', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          bottomNavigationBar: LundiBottomNavigationBar(),
        ),
      ),
    );
    expect(find.byType(LundiBottomNavigationBar), findsOneWidget);
  });
}
