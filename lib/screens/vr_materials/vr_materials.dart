//import statements
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/colors.dart';
import '../../widgets/lazy_image.dart';
import '../../widgets/theme_toggle_button.dart';

//hyperlinks for external resources
const String youtubeChannelUrl = 'https://www.youtube.com/@warnellvrlab';
const String vrCheckoutFormUrl = 'https://docs.google.com/forms/d/e/1FAIpQLScW3RJlXfUuNiWHifQgQZdld7Q4p0t0hceFo1n5-zgMY8RBkg/viewform?usp=header';
const String vrCheckinFormUrl = 'https://docs.google.com/forms/d/e/1FAIpQLSdFWFjoDly9Bu8waKSgZOEy41RW_f5XkFOXEXo04Qdkmxm1iA/viewform?pli=1';
const String vrHeadsetInstructions = 'https://drive.google.com/file/d/19xtkUkBc7KOkP2EGIz9adFN497YsOfJa/view';
const String unityDevelopmentGuide = 'https://docs.google.com/document/d/17YXO3ov6evBGmPRMIyoop3esnh1T9jPAtCr4ibtvloI/edit?tab=t.0#heading=h.wbd25knfx8ig';
const String mlcTechLending = 'https://www.libs.uga.edu/mlc/techlending';

//creates the VR Materials page of the app
class VRMaterials extends StatelessWidget {
  //contains each card and the contents within them
  static const List<_VRMaterialsEntry> _entries = [
    //youtube channel
    _VRMaterialsEntry(
      imagePath: 'lib/assets/images/perseus_vr_headsets_classroom.jpg',
      description:
          'The Warnell VR Lab interns have created a YouTube page for 360-degree forestry videos. Check it out by clicking on this card!',
      actionLabel: 'Visit the YouTube channel',
      actionUrl: youtubeChannelUrl,
      actionIcon: Icons.play_circle_fill_rounded,
    ),
    //VR headset checkout form
    _VRMaterialsEntry(
      imagePath: 'lib/assets/images/perseus_faculty_vr_headsets.JPG',
      description:
          'You can also check out VR headsets for yourself or a group of people using the check-out form below.',
      actionLabel: 'VR Check-out Form',
      actionUrl: vrCheckoutFormUrl,
      actionIcon: Icons.headset_rounded,
    ),
    //VR headset checkin form
    _VRMaterialsEntry(
      imagePath: 'lib/assets/images/perseus_drlowe_vr_headset.JPG',
      description:
          'Remember to fill out the check-in form when you return the headsets!',
      actionLabel: 'VR Check-in Form',
      actionUrl: vrCheckinFormUrl,
      actionIcon: Icons.headset_off_rounded,
    ),
    //VR headset instructions
    _VRMaterialsEntry(
      imagePath: 'lib/assets/images/perseus_drone_in_forest.JPG',
      description:
          'This is a quick and easy instruction page on how to use the VR headsets.',
      actionLabel: 'VR Headset Instructions',
      actionUrl: vrHeadsetInstructions,
      actionIcon: Icons.info_rounded,
    ),
    //Unity development guide
    _VRMaterialsEntry(
      imagePath: 'lib/assets/images/perseus_drone_in_forest.JPG',
      description:
          'If you want to create your own VR videos, read this guide to get started!',
      actionLabel: 'Unity Development Guide',
      actionUrl: unityDevelopmentGuide,
      actionIcon: Icons.book_rounded,
    ),
    //MLC tech lending policy
    _VRMaterialsEntry(  
      imagePath: 'lib/assets/images/perseus_drone_in_forest.JPG',
      description:
          'At UGA, our VR headsets are subject to the technology lending policy set by the Miller Learning Center (MLC). Check it out here.',
      actionLabel: 'MLC Tech Lending Policy',
      actionUrl: mlcTechLending,
      actionIcon: Icons.policy_rounded,
    ),
  ];

  //toggles between light and dark mode
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const VRMaterials({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  //builds the VR Materials page widget
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      //top bar of the app
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
                "VR Materials",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 25),
              // Description of overall content on this page
              const Text(
                "This page houses a collection of resources and materials related to the Warnell VR Lab. ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  height: 1.6,
                ),
              ),

              const SizedBox(height: 25),

              //Creates a list of cards using the defined card parameters above
              ...List.generate(
                _entries.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: _VRMaterialsResourceCard(
                    entry: _entries[index],
                    isDark: isDark,
                  ),
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}

//variables for each card entry
class _VRMaterialsEntry {
  final String imagePath;
  final String description;
  final String actionLabel;
  final String actionUrl;
  final IconData actionIcon;

  const _VRMaterialsEntry({
    required this.imagePath,
    required this.description,
    required this.actionLabel,
    required this.actionUrl,
    required this.actionIcon,
  });
}

//creates the VR Materials page of the app
class _VRMaterialsResourceCard extends StatelessWidget {
  final _VRMaterialsEntry entry;
  final bool isDark;

  const _VRMaterialsResourceCard({
    required this.entry,
    required this.isDark,
  });

  //builds the card widget that is used for each entry
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
          width: 1.2,
        ),
      ),
      color: isDark ? AppColors.cardDark : AppColors.cardLight,
      child: InkWell(
        onTap: () async {
          final uri = Uri.parse(entry.actionUrl);
          if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
            throw Exception('Could not launch $uri');
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //order of elements in each card from top to bottom: hyperlink, image, text description
            children: [
              //hyperlink at the top of each card
              Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                    color: isDark
                        ? const Color(0xFF24312A)
                        : const Color(0xFFF2F7F0),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: TextButton.icon(
                    onPressed: () async {
                      final uri = Uri.parse(entry.actionUrl);
                      if (!await launchUrl(
                          uri,
                          mode: LaunchMode.externalApplication)) {
                        throw Exception('Could not launch $uri');
                      }
                    },
                    style: TextButton.styleFrom(
                      foregroundColor:
                          isDark ? AppColors.textDark : AppColors.textLight,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                    ),
                    icon: Icon(entry.actionIcon),
                    label: Text(entry.actionLabel),
                  ),
                ),
              ),
              //spacing between the hyperlink and image
              const SizedBox(height: 18),
              //image in the center of each card
              LazyImage(assetPath: entry.imagePath),
              //spacing between the image and text description
              const SizedBox(height: 16),
              //text description of resource in the card
              Text(
                entry.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  height: 1.6,
                  color: isDark ? AppColors.textDark : AppColors.textLight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}