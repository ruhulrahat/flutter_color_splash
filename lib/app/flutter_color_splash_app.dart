import 'package:flutter/widgets.dart';
import 'package:flutter_color_splash/core/constants/color_constants.dart';
import 'package:flutter_color_splash/features/color_splash/flutter_color_splash_home_page.dart';

/// The FlutterColorSplashApp widget is stateless and builds a [WidgetsApp].
class FlutterColorSplashApp extends StatelessWidget {
  /// Creates the FlutterColorSplashApp.
  const FlutterColorSplashApp({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      debugShowCheckedModeBanner: false,
      color: whiteColor,
      builder: (_, __) {
        return const FlutterColorSplashHomePage();
      },
    );
  }
}
