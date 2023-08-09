import 'package:flutter/widgets.dart';
import 'package:flutter_color_splash/core/constants/color_constants.dart';
import 'package:flutter_color_splash/core/constants/text_constants.dart';
import 'package:flutter_color_splash/core/themes/text_styles.dart';

// ignore_for_file: avoid-late-keyword
/// The HomePage widget is stateful.
///
/// It builds a [ColoredBox] with a background color that changes on every tap.
/// It also displays a text that changes language when tapped.
class HomePage extends StatefulWidget {
  /// Creates the MyHomePage.
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

/// HomePageState is the state for [HomePage] widget.
///
/// This will build your main application.
class HomePageState extends State<HomePage> {
  /// The background color of the widget.
  late Color backgroundColor;

  /// The text displayed in the widget.
  late String text;

  @override
  void initState() {
    super.initState();
    backgroundColor = blackColor;
    text = defaultText;
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) => changeColors(),
      child: ColoredBox(
        color: backgroundColor,
        child: Center(
          child: Listener(
            onPointerDown: (_) => changeText(),
            child: Text(
              text,
              style: centerTextStyle,
            ),
          ),
        ),
      ),
    );
  }

  /// Changes the background color and text color.
  void changeColors() {
    setState(() {
      backgroundColor = generateRandomColor();
    });
  }

  /// Changes the displayed text to [ukranianText] or [defaultText].
  void changeText() {
    setState(() {
      text = text == defaultText ? ukranianText : defaultText;
    });
  }

  /// Generates a random color.
  ///
  /// This function uses the current time in microseconds since Epoch to create
  /// a pseudo-random color. It does this by using the microseconds to create an
  /// integer which will be used as a color value in the RGB color space.
  Color generateRandomColor() {
    // Get the current time in microseconds since Epoch.
    final int microsecondsSinceEpoch = DateTime.now().microsecondsSinceEpoch;

    // Calculate a pseudo-random color value by taking the current time modulo
    // the maximum color value.
    // The '+1' ensures that the color value will be within the range 0x000000
    // to 0xFFFFFF.
    final int randomColorValue = microsecondsSinceEpoch % (0xFFFFFF + 1);

    // Create a new Color object from the random color value.
    final Color randomColor = Color(randomColorValue).withOpacity(1.0);

    return randomColor;
  }
}
