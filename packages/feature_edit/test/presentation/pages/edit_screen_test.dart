import 'dart:async';

import 'package:feature_edit/presentation/pages/edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:shared/generated/l10n.dart';
import 'package:shared/models/plan_item.dart';
import 'package:shared/providers/plan_provider.dart';

class MockPlan2 extends AutoDisposeAsyncNotifier<List<PlanItem>>
    with Mock
    implements Plan {
  final _plan = <PlanItem>[
    PlanItem(date: DateTime.parse('2024-06-10'), place: 'Reykjavik'),
    PlanItem(date: DateTime.parse('2024-06-11'), place: 'Thingvellir'),
    PlanItem(date: DateTime.parse('2024-06-12'), place: 'Hengifoss'),
    PlanItem(date: DateTime.parse('2024-06-13'), place: 'Skogafoss'),
    PlanItem(date: DateTime.parse('2024-06-14'), place: 'Thakgil'),
    PlanItem(date: DateTime.parse('2024-06-15'), place: 'Jokulsarlon'),
  ];

  @override
  FutureOr<List<PlanItem>> build() => Future.value(_plan);

  // void fetch() async {
  //   state = AsyncLoading();
  //   state = AsyncValue.data(_plan);
  // }

  @override
  Future<void> reorder(int oldIndex, int newIndex) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      // TODO(kano): Calculate routes for all points and update times
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }
      final item = _plan.removeAt(oldIndex);
      _plan.insert(newIndex, item);
      return _plan;
    });
  }
}

void main() {
  late MockPlan2 mockPlan;
  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await S.load(const Locale('en'));
    mockPlan = MockPlan2();
  });

  Future<void> pumpApp(WidgetTester tester) async => mockNetworkImagesFor(
    () => tester.pumpWidget(
      ProviderScope(
        overrides: [planProvider.overrideWith(() => mockPlan)],
        child: MaterialApp(
          theme: ThemeData(colorScheme: const ColorScheme.light()),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          home: const Scaffold(body: EditScreen()),
        ),
      ),
    ),
  );

  group('EditScreen', () {
    testWidgets('calls fetch on init', (tester) async {
      await pumpApp(tester);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      final context = tester.element(find.byType(EditScreen));
      final c = ProviderScope.containerOf(context);

      verify(c.read(planProvider.notifier).fetch()).called(1);
    });
    testWidgets('has exactly 6 elements', (tester) async {
      await pumpApp(tester);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(find.byType(ListTile), findsNWidgets(6));
    });
  });
}
