//import statements
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  //toggles between light and dark mode
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const SettingsPage({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  //builds the settings page widget
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Card(
          child: Padding(
            //switches between light and dark mode when toggled by user
            padding: const EdgeInsets.all(20.0),
            child: SwitchListTile(
              title: const Text('Theme'),
              subtitle: Text(
                isDark ? 'Dark mode is enabled' : 'Light mode is enabled',
              ),
              value: isDark,
              onChanged: (_) {
                onToggleTheme();
              },
            ),
          ),
        ),
      ),
    );
  }
}