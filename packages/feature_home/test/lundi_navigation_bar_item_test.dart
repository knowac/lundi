import 'package:feature_home/presentation/widgets/lundi_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('LundiNavigationBarItem renders', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            items: [
              LundiNavigationBarItem(iconData: Icons.home),
              LundiNavigationBarItem(iconData: Icons.abc),
            ],
          ),
        ),
      ),
    );
    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.byIcon(Icons.abc), findsOneWidget);
  });
}
