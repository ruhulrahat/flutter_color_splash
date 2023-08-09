import 'package:flutter/material.dart';
import 'package:flutter_color_splash/app/flutter_color_splash_app.dart';
import 'package:flutter_color_splash/features/color_splash/home_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Future<HomePageState> initializeTest(
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const FlutterColorSplashApp());

    return tester.state(find.byType(HomePage));
  }

  group('HomePageState', () {
    test('generateRandomColor generates valid color', () {
      final pageState = HomePageState();
      final Color color = pageState.generateRandomColor();
      expect(color, isInstanceOf<Color>());
    });

    testWidgets('changeColors changes colors', (WidgetTester tester) async {
      final pageState = await initializeTest(tester);
      final Color initialBackgroundColor = pageState.backgroundColor;
      pageState.changeColors();
      expect(pageState.backgroundColor, isNot(equals(initialBackgroundColor)));
    });

    testWidgets('changeText changes text', (WidgetTester tester) async {
      final pageState = await initializeTest(tester);
      final String initialText = pageState.text;
      pageState.changeText();
      expect(pageState.text, isNot(equals(initialText)));
    });
  });
}
