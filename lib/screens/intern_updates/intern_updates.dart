//import statements
import 'package:flutter/material.dart';
import '../../widgets/lazy_image.dart';
import '../../widgets/theme_toggle_button.dart';

//creates the Intern Updates page of the app
class InternUpdates extends StatelessWidget {
  
  //toggles between light and dark mode
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const InternUpdates({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

//builds the Intern Updates page widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Warnell VR Lab"),
        centerTitle: true,
        actions: [
          ThemeToggleButton(
            isDarkMode: isDarkMode,
            onToggleTheme: onToggleTheme,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Page Title
              const Text(
                "Intern Updates",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 25),
              // Description of overall page content
              const Text(
                "Stay updated with the latest news on the Warnell VR Lab interns. ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  height: 1.6,
                ),
              ),


              const SizedBox(height: 25),
              // Image of Whitehall field day DBH activity for the interns
              const LazyImage(assetPath: 'lib/assets/images/perseus_whitehall_dbh_activity.JPG'),

              const SizedBox(height: 25),
              // Description of the forest VR equipment image
              const Text(
                "In this image, some of the PERSEUS Project interns are competing to identify the correct tree diameter using DBH measurements.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  height: 1.6,
                ),
              ),


              const SizedBox(height: 25),
              // Image of forest VR equipment
              const LazyImage(assetPath: 'lib/assets/images/perseus_vr_camera_woods.jpeg'),

              const SizedBox(height: 25),
              // Description of the forest VR equipment image
              const Text(
                "This image showcases the equipment used by the Warnell VR Lab interns to capture tree imagery at Whitehall Forest.",             
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  height: 1.6,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
