import 'package:flutter/material.dart';
import 'package:flutter_color_splash/app/flutter_color_splash_app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FlutterColorSplashApp', () {
    testWidgets('Tapping outside text changes colors',
        (WidgetTester tester) async {
      await tester.pumpWidget(const FlutterColorSplashApp());

      final coloredBoxFinder = find.byType(ColoredBox);

      final initialBackgroundColor =
          _getBackgroundColorFromColoredBox(tester, coloredBoxFinder);
      await tester.tapAt(Offset.zero);
      await tester.pump();

      final updatedBackgroundColor =
          _getBackgroundColorFromColoredBox(tester, coloredBoxFinder);

      expect(updatedBackgroundColor, isNot(equals(initialBackgroundColor)));
    });

    testWidgets('Tapping on text changes language',
        (WidgetTester tester) async {
      await tester.pumpWidget(const FlutterColorSplashApp());

      final textFinder = find.byType(Text);

      final initialText = _getTextFromWidget(tester, textFinder);
      await tester.tap(textFinder);
      await tester.pump();

      final updatedText = _getTextFromWidget(tester, textFinder);

      expect(updatedText, isNot(equals(initialText)));
    });
  });
}

Color? _getBackgroundColorFromColoredBox(
  WidgetTester tester,
  Finder coloredBoxFinder,
) {
  final ColoredBox coloredBox = tester.firstWidget(coloredBoxFinder);

  return coloredBox.color;
}

String? _getTextFromWidget(WidgetTester tester, Finder textFinder) {
  final Text textWidget = tester.firstWidget(textFinder);

  return textWidget.data;
}
