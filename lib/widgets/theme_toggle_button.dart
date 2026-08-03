import 'package:flutter/material.dart';

//creates a settings icon button that routes to the settings screen
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
        tooltip: 'Open settings',
        icon: const Icon(Icons.settings),
        onPressed: () {
          Navigator.pushNamed(context, '/settings');
        },
      ),
    );
  }
}
