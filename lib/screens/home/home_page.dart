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
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            //adds a thin border around the app icon so that it is easily visible
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.secondary,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            //places the app icon in the top left corner of the home page
            padding: const EdgeInsets.all(2),
            child: Image.asset(
              'lib/assets/images/WarnellVRLabAppIcon.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
        //centers the title of the app in the center of the top banner
        title: const Text("Warnell VR Lab"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            //displays settings button on home page
            child: IconButton(
              tooltip: 'Open settings', //displays text when hovering over the settings icon
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
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
              //title card that introduces the app's purpose and content
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        "Welcome to the Warnell VR Lab!",
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
              
              //individual buttons for the different screens of the app
              //First: VR Materials
              const SizedBox(height: 16),
              CustomButton(
                text: "VR Materials",
                icon: Icons.view_in_ar,
                onPressed: () {
                  Navigator.pushNamed(context, "/vr_materials");
                },
              ),
              //Second: Posters and Publications
              const SizedBox(height: 12),
              CustomButton(
                text: "Posters and Publications",
                icon: Icons.newspaper,
                onPressed: () {
                  Navigator.pushNamed(context, "/posters_and_publications");
                },
              ),
              //Third: Intern Updates
              const SizedBox(height: 12),
              CustomButton(
                text: "Intern Updates",
                icon: Icons.circle_notifications,
                onPressed: () {
                  Navigator.pushNamed(context, "/intern_updates");
                },
              ),
              //Fourth: Contact Form
              const SizedBox(height: 12),
              CustomButton(
                text: "Contact Form",
                icon: Icons.feedback_outlined,
                onPressed: () {
                  Navigator.pushNamed(context, "/contact_form");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}