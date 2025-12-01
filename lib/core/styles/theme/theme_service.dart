import 'package:flutter/material.dart';
import 'package:sji_mobile/core/styles/color/styles_color.dart';

class ThemeService {
  static final ValueNotifier<bool> isDarkMode = ValueNotifier<bool>(true);

  static void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
  }

  static ThemeData get currentTheme {
    return isDarkMode.value ? _darkTheme : _lightTheme;
  }

  static Color get backgroundColor {
    return isDarkMode.value ? AppColors.darkBackground : AppColors.lightBackground;
  }

  static Color get cardColor {
    return isDarkMode.value ? AppColors.darkCard : AppColors.lightCard;
  }

  static Color get textPrimaryColor {
    return isDarkMode.value ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
  }

  static Color get textSecondaryColor {
    return isDarkMode.value ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;
  }

  static final ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    primaryColor: AppColors.primaryGreen,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryGreen,
      secondary: AppColors.primaryDarkGreen,
      background: AppColors.darkBackground,
      surface: AppColors.darkCard,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkBackground,
      elevation: 0,
    ),
    
  );

  
  static final ThemeData _lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackground,
    primaryColor: AppColors.primaryGreen,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryGreen,
      secondary: AppColors.primaryDarkGreen,
      background: AppColors.lightBackground,
      surface: AppColors.lightCard,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightBackground,
      elevation: 0,
    ),
   
  );
}