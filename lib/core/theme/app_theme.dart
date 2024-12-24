import 'package:flutter/material.dart';
import 'package:real_estate_app/core/constants/app_colors.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
        primaryColor: AppColors.primary, // Set primary color
        scaffoldBackgroundColor: Colors.white, // Set scaffold background color
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent, // Transparent app bar
          elevation: 0, // No elevation
          iconTheme: IconThemeData(color: Colors.black), // Icon color
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary, // Button background color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // Rounded corners
            ),
          ),
        ),
      );
}
