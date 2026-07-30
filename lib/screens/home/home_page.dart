//import statements
import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';

//main class for the home page
class HomePage extends StatelessWidget {
  
  //toggles between light and dark mode
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const HomePage({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  //builds the home page widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Warnell VR Lab"),
        centerTitle: true,
        actions: [
          //adds message when hovering over icon for user to switch between light and dark mode
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
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        "Welcome to the Warnell VR Lab",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      //short description about the Warnell VR Lab app
                      const SizedBox(height: 10),
                      Text(
                        "Explore immersive forestry research and innovations in virtual reality from interns at the University of Georgia.",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                "Choose a section to continue",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              CustomButton(
                text: "VR Materials",
                icon: Icons.view_in_ar,
                onPressed: () {
                  Navigator.pushNamed(context, "/vr_materials");
                },
              ),
              const SizedBox(height: 12),
              CustomButton(
                text: "Posters and Publications",
                icon: Icons.newspaper,
                onPressed: () {
                  Navigator.pushNamed(context, "/posters_and_publications");
                },
              ),
              const SizedBox(height: 12),
              CustomButton(
                text: "Intern Updates",
                icon: Icons.circle_notifications,
                onPressed: () {
                  Navigator.pushNamed(context, "/intern_updates");
                },
              ),
              const SizedBox(height: 12),
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