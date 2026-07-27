import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';

class HomePage extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const HomePage({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Warnell VR Lab"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              tooltip: isDarkMode ? 'Switch to light mode' : 'Switch to dark mode',
              icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
              onPressed: onToggleTheme,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 30),

              const Text(
                "Welcome to the VR Lab at the \nWarnell School of Forestry and Natural Resources!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                "Choose one of the options below to continue.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 40),

              CustomButton(
                text: "VR Materials",
                icon: Icons.view_in_ar,
                onPressed: () {
                  Navigator.pushNamed(context, "/vr_materials");
                },
              ),

              const SizedBox(height: 15),

              CustomButton(
                text: "Posters and Publications",
                icon: Icons.newspaper,
                onPressed: () {
                  Navigator.pushNamed(context, "/posters_and_publications");
                },
              ),

              const SizedBox(height: 15),

              CustomButton(
                text: "Intern Updates",
                icon: Icons.circle_notifications,
                onPressed: () {
                  Navigator.pushNamed(context, "/intern_updates");
                },
              ),

              const SizedBox(height: 15),

              CustomButton(
                text: "Robot",
                icon: Icons.smart_toy_outlined,
                onPressed: () {
                  Navigator.pushNamed(context, "/robot");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}