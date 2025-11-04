import 'package:flutter/material.dart';
import 'colors_manager.dart';

class ThemeManager {

  static ThemeData get lightTheme {
    Color primaryColor = ColorsManager.gold;
   return ThemeData(
     useMaterial3: true,
     brightness: Brightness.light,
     scaffoldBackgroundColor: ColorsManager.lightBackground,
     fontFamily: 'Cormorant',
     primaryColor: primaryColor,
     colorScheme: ColorScheme.light(
       primary: primaryColor,
       secondary: ColorsManager.accent,
       surface: ColorsManager.lightBackground,
     ),
     appBarTheme: const AppBarTheme(
       backgroundColor: ColorsManager.lightBackground,
       elevation: 0,
       foregroundColor: ColorsManager.black,
     ),
     drawerTheme: const DrawerThemeData(
       backgroundColor: ColorsManager.lightBackground,
     ),
     checkboxTheme: CheckboxThemeData(
       checkColor: WidgetStatePropertyAll(primaryColor),
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
     ),
     floatingActionButtonTheme: FloatingActionButtonThemeData(
       backgroundColor: primaryColor,
       foregroundColor: Colors.white,
     ),
     iconTheme: const IconThemeData(color: ColorsManager.dimGrey),
     textTheme: TextTheme(
       displayLarge: TextStyle(
         fontSize: 28,
         fontWeight: FontWeight.bold,
         color: primaryColor,
       ),
       titleLarge: TextStyle(
         color: primaryColor,
         fontFamily: 'Cormorant',
         fontSize: 30,
         fontWeight: FontWeight.bold,
       ),
       bodyMedium: const TextStyle(fontSize: 16),
       bodySmall: TextStyle(
         color: Colors.grey[500],
         fontSize: 15,
         fontWeight: FontWeight.bold,
       ),
     ),
     elevatedButtonTheme: ElevatedButtonThemeData(
       style: ElevatedButton.styleFrom(
         backgroundColor: primaryColor,
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
         padding: const EdgeInsets.symmetric(horizontal: 30),
       ),
     ),
   );
  }

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: ColorsManager.lightBackground,
    fontFamily: 'Cormorant',
    colorScheme: ColorScheme.dark(
      primary: ColorsManager.darkGrey,
      secondary: ColorsManager.darkGrey,
      surface: ColorsManager.lightBackground,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorsManager.darkGrey,
      foregroundColor: ColorsManager.white,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.grey,
      ),
      titleLarge: TextStyle(
        color: ColorsManager.darkGrey,
        fontFamily: 'Cormorant',
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: ColorsManager.black,
      ),
      bodySmall: TextStyle(
        color: Colors.grey[500],
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.darkGrey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(horizontal: 30),
      ),
    ),

    drawerTheme: const DrawerThemeData(
      backgroundColor: ColorsManager.lightBackground,
    ),

    checkboxTheme: CheckboxThemeData(
      checkColor: const WidgetStatePropertyAll(ColorsManager.black87),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorsManager.darkGrey, // Keep the same vibrant color
      foregroundColor: Colors.white, // Keep foreground color white
    ),
    iconTheme: const IconThemeData(color: ColorsManager.grey),
    navigationRailTheme: const NavigationRailThemeData(
      backgroundColor: Color(0XFF4B4B4B),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0XFF4B4B4B),
    ),
  );
}
