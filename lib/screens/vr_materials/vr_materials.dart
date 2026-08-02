//import statements
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widgets/lazy_image.dart';
import '../../widgets/theme_toggle_button.dart';

const String youtubeChannelUrl = 'https://www.youtube.com/@warnellvrlab';

//creates the VR Materials page of the app
class VRMaterials extends StatelessWidget {
  
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
                "Thank you for visiting the VR Materials page!"
                " Here, you'll find a collection of resources and materials related to the Warnell VR Lab. ",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 18,
                  height: 1.6,
                ),
              ),

              const SizedBox(height: 25),
               //Image of students wearing VR headsets in the classroom
              const LazyImage(assetPath: 'lib/assets/images/perseus_vr_headsets_classroom.jpg'),

              const SizedBox(height: 25),
              // Description of actions for the user to take on this page regarding VR headsets
              const Text(
                "The Warnell VR Lab interns have created a YouTube page for 360-degree forestry videos.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 18,
                  height: 1.6,
                ),
              ),

              //YouTube channel button will open the hyperlink in an external browser when pressed
              const SizedBox(height: 18),
              TextButton.icon(
                //button opens YouTube channel in external browser
                onPressed: () async {
                  final uri = Uri.parse(youtubeChannelUrl);
                  //throws exception if URL cannot be launched
                  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
                    throw Exception('Could not launch $uri');
                    }
                },
                //icon and label to display on the button
                icon: const Icon(Icons.play_circle_fill_rounded),
                label: const Text('Visit the YouTube channel'),
              ),

              //description of VR headset checkout form and supplemental materials
              const SizedBox(height: 25),
              const Text(
                "You can also check out VR headsets for yourself or a group of people using the checkout form and supplemental documents below.",
                textAlign: TextAlign.justify,
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
