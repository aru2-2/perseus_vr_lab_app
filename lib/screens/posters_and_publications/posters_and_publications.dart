//import statements
import 'package:flutter/material.dart';
import '../../widgets/lazy_image.dart';
import '../../widgets/theme_toggle_button.dart';

//creates the Posters and Publications page of the app
class PostersAndPublications extends StatelessWidget {
  
  //toggles between light and dark mode
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const PostersAndPublications({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

//builds the Posters and Publications page widget
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
                "Posters and Publications",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 25),
              // Description of overall page content
              const Text(
                "Explore the collection of posters and publications related to the Warnell VR Lab.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  height: 1.6,
                ),
              ),
      

              const SizedBox(height: 25),
              // Image of Purdue poster presentation in 2026
              const LazyImage(assetPath: 'lib/assets/images/perseus_purdue_poster_2026.jpeg'),


              const SizedBox(height: 25),
              // Description of Purdue poster presentation in 2026
              const Text(
                "Joey, Addy, and Maadhavan presented about the Warnell VR Lab at the Application and Solutions in Digital Forestry International Conference at Purdue University."
                " They showcased the capabilities of our VR Lab as experiential learning in immersive solutions."
                " (fix and add more details)",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  height: 1.6,
                ),
              ),
              
              const SizedBox(height: 25),
              // Image of PERSEUS poster presentation at CURO 2026
              const LazyImage(assetPath: 'lib/assets/images/perseus_curo_picture_2026.jpeg'),


              const SizedBox(height: 25),
              // Description of CURO 2026 poster presentation
              const Text(
                "Joey, Addy, and Maadhavan presented about forestry education in a virtual world at CURO 2026, showcasing the capabilities of our VR Lab and the potential applications of our research." 
                " The poster highlighted their work in 360-degree virtual reality and LiDAR simulations in the classroom."
                " (fix and add more details)",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  height: 1.6,
                ),
              ),

              const SizedBox(height: 25),
              // Image of UGA presentation in 2025
              const LazyImage(assetPath: 'lib/assets/images/perseus_uga_presentation_2025.jpeg'),


              const SizedBox(height: 25),
              // Description of UGA presentation in 2025
              const Text(
                "Maadhavan presented about forests in a virtual world at the 2025 PERSEUS Annual Meeting at the University of Georgia." 
                " His presentation demonstrated initial research into using virtual reality headsets to advance the PERSEUS Project objectives."
                " (fix and add more details)",
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
