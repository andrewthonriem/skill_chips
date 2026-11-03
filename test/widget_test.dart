import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:skill_chips/main.dart';

void main() {
  testWidgets('user can add and delete a skill chip', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const SkillChipsApp());

    expect(find.text('Flutter'), findsNothing);
    expect(
      find.text('Add a skill above to see its chip here.'),
      findsOneWidget,
    );

    await tester.enterText(find.byType(TextField), 'Kotlin');
    await tester.tap(find.byTooltip('Add skill'));
    await tester.pump();

    expect(find.text('Kotlin'), findsOneWidget);
    expect(find.byIcon(Icons.close), findsOneWidget);
    expect(find.byTooltip('Delete Kotlin'), findsOneWidget);

    await tester.tap(find.byTooltip('Delete Kotlin'));
    await tester.pump();

    expect(find.text('Kotlin'), findsNothing);
    expect(
      find.text('Add a skill above to see its chip here.'),
      findsOneWidget,
    );
  });

  testWidgets('tooltips appear when hovering over add and delete controls', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const SkillChipsApp());

    final mouse = await tester.createGesture(kind: PointerDeviceKind.mouse);
    await mouse.addPointer();

    await mouse.moveTo(tester.getCenter(find.byTooltip('Add skill')));
    await tester.pump(const Duration(seconds: 1));
    expect(find.text('Add skill'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'Dart');
    await tester.tap(find.byTooltip('Add skill'));
    await tester.pump();

    await mouse.moveTo(tester.getCenter(find.byTooltip('Delete Dart')));
    await tester.pump(const Duration(seconds: 1));
    expect(find.text('Delete Dart'), findsOneWidget);

    await mouse.removePointer();
  });

  testWidgets('tooltips appear on long press on touch devices', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const SkillChipsApp());

    await tester.longPress(find.byTooltip('Add skill'));
    await tester.pump();
    expect(find.text('Add skill'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'Dart');
    await tester.tap(find.byTooltip('Add skill'));
    await tester.pump();

    await tester.longPress(find.byTooltip('Delete Dart'));
    await tester.pump();
    expect(find.text('Delete Dart'), findsOneWidget);
    expect(find.text('Dart'), findsOneWidget);
  });
}
