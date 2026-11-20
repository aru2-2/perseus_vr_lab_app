//import statements
import 'package:flutter/material.dart';

//creates the Settings Page of the app
class SettingsPage extends StatelessWidget {
  //variables for the features of the settings screen
  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;
  final double fontScale;
  final ValueChanged<double> onChangeFontScale;
  final bool increaseContrast;
  final VoidCallback onToggleIncreaseContrast;

  const SettingsPage({
    super.key,
    required this.themeMode,
    required this.onThemeModeChanged,
    required this.fontScale,
    required this.onChangeFontScale,
    required this.increaseContrast,
    required this.onToggleIncreaseContrast,
  });

  //builds the settings page widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<ThemeMode>(
                  initialValue: themeMode,
                  isExpanded: true,
                  decoration: const InputDecoration(labelText: 'Theme'),
                  items: const [
                    DropdownMenuItem(
                      value: ThemeMode.system,
                      child: Text('System'),
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.light,
                      child: Text('Light'),
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.dark,
                      child: Text('Dark'),
                    ),
                  ],
                  onChanged: (mode) {
                    if (mode != null) {
                      onThemeModeChanged(mode);
                    }
                  },
                ),
                //slider adjusts the font size for the app based on the user's preferences
                const SizedBox(height: 12),
                Text(
                  'Font size',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 6),
                Slider(
                  value: fontScale,
                  min: 0.8,
                  max: 2.0,
                  divisions: 12,
                  label: '${fontScale.toStringAsFixed(1)}x',
                  onChanged: onChangeFontScale,
                ),
                //displays the current font size for the user
                Text(
                  'Current size: ${fontScale.toStringAsFixed(1)}x',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                //toggle switches between standard and higher contrast for user comfort
                const SizedBox(height: 16),
                SwitchListTile(
                  title: const Text('Contrast'),
                  subtitle: Text(
                    increaseContrast
                        ? 'Higher contrast is enabled'
                        : 'Standard contrast is enabled',
                  ),
                  value: increaseContrast,
                  onChanged: (_) {
                    onToggleIncreaseContrast();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
