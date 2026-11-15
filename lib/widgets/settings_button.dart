//import statements
import 'package:flutter/material.dart';

//Provides a settings action for app bars.
class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  //builds settings icon button widget
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
