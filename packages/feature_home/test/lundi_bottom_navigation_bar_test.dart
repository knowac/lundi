import 'package:feature_home/presentation/widgets/lundi_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('LundiBottomNavigationBar renders', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(bottomNavigationBar: LundiBottomNavigationBar()),
      ),
    );
    expect(find.byType(LundiBottomNavigationBar), findsOneWidget);
  });
}
