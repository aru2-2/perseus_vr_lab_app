//import statements for flutter and the different screens of the app
import 'package:flutter/material.dart';
import 'screens/home/home_page.dart';
import 'screens/vr_materials/vr_materials.dart';
import 'screens/posters_and_publications/posters_and_publications.dart';
import 'screens/intern_updates/intern_updates.dart';
import 'screens/robot/robot.dart';
import 'utils/colors.dart';

void main() {
  runApp(const WarnellVRLab());
}

//main class for the app
class WarnellVRLab extends StatefulWidget {
  const WarnellVRLab({super.key});

  @override
  State<WarnellVRLab> createState() => _WarnellVRLabState();
}

//state class for the main class
//controls the toggle between light mode and dark mode, and defines the routes for the different screens of the app
class _WarnellVRLabState extends State<WarnellVRLab> {
  //controls the toggle between light mode and dark mode
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  //build method that returns a widget
  //contains the title, debug banner, initial route, and defined routes for the different screens of the app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Warnell VR Lab',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColors.backgroundLight,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.buttonText,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.buttonText,
          ),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: AppColors.textLight),
          bodyMedium: TextStyle(color: AppColors.textLight),
          titleLarge: TextStyle(color: AppColors.textLight),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.backgroundDark,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.buttonText,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.buttonText,
          ),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: AppColors.textDark),
          bodyMedium: TextStyle(color: AppColors.textDark),
          titleLarge: TextStyle(color: AppColors.textDark),
        ),
      ),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,

      initialRoute: '/',

      //defines the routes for the different screens of the app
      routes: {
        '/': (context) => HomePage(
              isDarkMode: isDarkMode,
              onToggleTheme: toggleTheme,
            ),
        '/vr_materials': (context) => VRMaterials(
              isDarkMode: isDarkMode,
              onToggleTheme: toggleTheme,
            ),
        '/posters_and_publications': (context) => PostersAndPublications(
              isDarkMode: isDarkMode,
              onToggleTheme: toggleTheme,
            ),
        '/intern_updates': (context) => InternUpdates(
              isDarkMode: isDarkMode,
              onToggleTheme: toggleTheme,
            ),
        '/robot': (context) => Robot(
              isDarkMode: isDarkMode,
              onToggleTheme: toggleTheme,
            ),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('Page not found'),
            ),
          ),
        );
      },
    );
  }
}