//import statements
import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../widgets/lazy_image.dart';
import '../../widgets/theme_toggle_button.dart';

//creates the Intern Updates page of the app
class InternUpdates extends StatelessWidget {
  static const List<_InternUpdateEntry> _entries = [
    _InternUpdateEntry(
      imagePath: 'lib/assets/images/perseus_whitehall_dbh_activity.JPG',
      description:
          'In this image, some of the PERSEUS Project interns are competing to identify the correct tree diameter using DBH measurements.',
    ),
    _InternUpdateEntry(
      imagePath: 'lib/assets/images/perseus_uga_conference_discussion.JPG',
      description:
          'Here, the Warnell VR Lab interns discuss their work using VR headsets for forestry education with faculty and researchers at the 2025 PERSEUS Annual Meeting.',
    ),
    _InternUpdateEntry(
      imagePath: 'lib/assets/images/perseus_drone_in_forest.JPG',
      description:
          'In the image above, the Warnell VR lab interns learn how to operate a drone that captures land cover data over Whitehall Forest.',
    ),
    _InternUpdateEntry(
      imagePath: 'lib/assets/images/perseus_vr_camera_woods.jpeg',
      description:
          'This image showcases the 360-degree camera equipment used by the Warnell VR Lab interns to capture tree imagery at Whitehall Forest.',
    ),
  ];

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
                        "What's Next",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: colorScheme.primary,
                        ),
                      ),
                      
                      //longer description about Percy's development
                      const SizedBox(height: 12),
                      Text(
                        "Percy, our Warnell VR Lab robot, is still in development. He will collect LiDAR data and capture tree imagery around his home.",
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
              ...List.generate(
                _entries.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: _InternUpdateEntryCard(
                    entry: _entries[index],
                    isDark: isDark,
                  ),
                ),
              ),



//bold PERSEUS acronym explained, taken from Warnell VR website
              const SizedBox(height: 25),
              const Text(
                "PROMOTING ECONOMIC RESILIENCE AND SUSTAINABILITY OF EASTERN U.S. FORESTS",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  height: 1.6,
                  fontWeight: FontWeight.bold,
                ),
              ),

              //image of PERSEUS logo
              const SizedBox(height: 40),
              const LazyImage(assetPath: 'lib/assets/images/perseus_logo.jpg'),

              //description of the PERSEUS Project, taken from Warnell VR website
              const SizedBox(height: 25),
              const Text(
                "Funded by USDA's NIFA program, PERSEUS is a multi-institution collaboration between the University of Georgia, Purdue University, and the University of Maine. The PERSEUS project will provide the necessary foundation for redefining national forest inventory in the U.S., while also providing the ability to project future forest conditions and provide ecosystem services across contrasting scales."
                " Eastern U.S. forests are predominantly privately owned, and forest landowners often lack basic information and tools necessary to assess, manage, and project important forest ecosystem services and their potential economic value."
                " PERSEUS will allow land managers to make informed decisions that will affect the delivery, sustainability, and resilience of forest resources.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  height: 1.6,
                ),
              ),

              //italicized description of funding for the PERSEUS Project, taken from Warnell VR website
              const SizedBox(height: 25),
              const Text(
                "This work is supported by the U.S. Department of Agriculture, National Institute of Food and Agriculture, Sustainable Agricultural Systems program, PERSEUS grant, #2023-68012-38992.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  height: 1.6,
                  fontStyle: FontStyle.italic,
                ),
              ),
              


            ],
          ),
        ),
      ),
    );
  }
}

class _InternUpdateEntry {
  final String imagePath;
  final String description;

  const _InternUpdateEntry({
    required this.imagePath,
    required this.description,
  });
}

class _InternUpdateEntryCard extends StatelessWidget {
  final _InternUpdateEntry entry;
  final bool isDark;

  const _InternUpdateEntryCard({
    required this.entry,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
          width: 1.2,
        ),
      ),
      color: isDark ? AppColors.cardDark : AppColors.cardLight,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LazyImage(assetPath: entry.imagePath),
            const SizedBox(height: 16),
            Text(
              entry.description,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 17,
                height: 1.6,
                color: isDark ? AppColors.textDark : AppColors.textLight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
