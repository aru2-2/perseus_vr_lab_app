//import statements
import 'package:flutter/material.dart';
import '../../utils/colors.dart';
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
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

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
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                  side: BorderSide(
                    color: isDark ? AppColors.borderDark : AppColors.borderLight,
                    width: 1.2,
                  ),
                ),
                color: isDark ? AppColors.cardDark : AppColors.cardLight,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      //creates a robot icon with a gradient background
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(
                            colors: [AppColors.primary, AppColors.secondary],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: const Icon(
                          Icons.smart_toy_outlined,
                          size: 40,
                          color: AppColors.buttonText,
                        ),
                      ),

                      //Coming soon message for description about Percy, the Warnell VR Lab robot
                      Text(
                        "Coming Soon",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: colorScheme.primary,
                        ),
                      ),
                      
                      //longer description about Percy's development
                      const SizedBox(height: 12),
                      Text(
                        "Percy, our Warnell VR Lab robot, is still in development. Soon, you’ll be able to explore updates about his research missions as he collects LiDAR data and captures tree imagery around his home.",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          height: 1.6,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),

                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: isDark ? const Color(0xFF24312A) : const Color(0xFFF2F7F0),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        
                        //shorter, catchier message for users
                        child: Text(
                          "Stay tuned for Percy's adventures around the UGA campus!",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: isDark ? AppColors.textDark : AppColors.textLight,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),

              const SizedBox(height: 25),

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
