import 'package:flutter/material.dart';

//creates a toggle between light mode and dark mode throughout the app
class ThemeToggleButton extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const ThemeToggleButton({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: IconButton(
        tooltip: isDarkMode ? 'Switch to light mode' : 'Switch to dark mode',
        icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
        onPressed: onToggleTheme,
      ),
    );
  }
}
