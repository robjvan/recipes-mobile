import 'package:flutter/material.dart';
import 'package:recipes_mobile/controllers/app_state.controller.dart';

@immutable
class AppTheme {
  static ThemeData themeData = ThemeData(
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    useMaterial3: true,
    fontFamily: 'Montserrat',
  );
}

@immutable
class AppStyles {}

@immutable
class AppColors {
  static Color backgroundColor() {
    return AppStateController.useDarkMode.value == true
        ? AppColors.bgColorDarkMode
        : AppColors.bgColorLightMode;
  }

  static Color sheetColor() {
    return AppStateController.useDarkMode.value == true
        ? AppColors.darkishGrey
        : AppColors.lightishGrey;
  }

  static Color textColor() {
    return AppStateController.useDarkMode.value == true
        ? textColorDarkMode
        : textColorLightMode;
  }

  static Color scaffoldColor() {
    return AppStateController.useDarkMode.value == true ? black : white;
  }

  static const List<Color> darkModeBorderColors = <Color>[
    AppColors.lightBlue,
    AppColors.green,
    AppColors.grey,
  ];
  static const List<Color> lightModeBorderColors = <Color>[
    AppColors.grey,
    AppColors.grey,
    AppColors.green,
    AppColors.lightBlue,
  ];
  static List<Color> darkModeButtonColors = <Color>[
    AppColors.lightBlue.withOpacity(0.8),
    AppColors.green.withOpacity(0.6)
  ];
  static const List<Color> lightModeButtonColors = <Color>[
    AppColors.green,
    AppColors.lightBlue
  ];

  static const Color textColorLightMode = darkGrey;
  static const Color textColorDarkMode = white;
  static const Color bgColorLightMode = white;
  static const Color bgColorDarkMode = darkGrey;

  static const Color primaryColor = Color.fromARGB(255, 203, 227, 247);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color green = Color.fromARGB(255, 65, 255, 65);
  static const Color lightBlue = Color(0xFF3299F1);
  static const Color blue = Color(0xFF0000FF);
  static const Color red = Color(0xFFFF0000);
  static const Color grey = Color(0xFF808080);
  static const Color lightGrey = Color(0xFFDDDDDD);
  static const Color lightishGrey = Color(0xFFDADADA);
  static const Color darkishGrey = Color(0xFF353535);
  static const Color darkGrey = Color(0xFF202020);
  static const Color lavender = Color(0xFFD0BCFF);
}
