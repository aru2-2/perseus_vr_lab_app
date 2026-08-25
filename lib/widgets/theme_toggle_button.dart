//import statements
import 'package:flutter/material.dart';

//creates a settings icon button that switches between light and dark mode for now
class ThemeToggleButton extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const ThemeToggleButton({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  //builds settings icon button widget
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: IconButton(
        //allows user to open settings screen
        tooltip: 'Open settings',
        icon: const Icon(Icons.settings),
        onPressed: () {
          Navigator.pushNamed(context, '/settings');
        },
      ),
    );
  }
}
