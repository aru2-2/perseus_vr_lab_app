//import statements
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
                "This page houses a collection of resources and materials related to the Warnell VR Lab. ",
                textAlign: TextAlign.center,
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
                "The Warnell VR Lab interns have created a YouTube page for 360-degree forestry videos. Check it out below!",
                textAlign: TextAlign.center,
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

              const SizedBox(height: 25),
               //Image of teachers and faculty wearing VR headsets in the classroom
              const LazyImage(assetPath: 'lib/assets/images/perseus_faculty_vr_headsets.JPG'),

              //description of VR headset checkout form
              const SizedBox(height: 25),
              const Text(
                "You can also check out VR headsets for yourself or a group of people using the check-out form below.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  height: 1.6,
                ),
              ),

              //VR headset checkout form hyperlink will open in an external browser when pressed
              const SizedBox(height: 18),
              TextButton.icon(
                //button opens VR headset checkout form in external browser
                onPressed: () async {
                  final uri = Uri.parse(vrCheckoutFormUrl);
                  //throws exception if URL cannot be launched
                  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
                    throw Exception('Could not launch $uri');
                    }
                },
                //icon and label to display on the button
                icon: const Icon(Icons.headset_rounded),
                label: const Text('VR Check-out Form'),
              ),

              //description of VR headset checkin form
              const SizedBox(height: 25),
              const Text(
                "Remember to fill out the check-in form when you return the headsets!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  height: 1.6,
                ),
              ),

              //VR headset checkin form hyperlink will open in an external browser when pressed
              const SizedBox(height: 18),
              TextButton.icon(
                //button opens VR headset checkin form in external browser
                onPressed: () async {
                  final uri = Uri.parse(vrCheckinFormUrl);
                  //throws exception if URL cannot be launched
                  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
                    throw Exception('Could not launch $uri');
                    }
                },
                //icon and label to display on the button
                icon: const Icon(Icons.headset_off_rounded),
                label: const Text('VR Check-in Form'),
              ),

              const SizedBox(height: 25),
               //Image of Dr. Lowe experimenting with a VR headset
              const LazyImage(assetPath: 'lib/assets/images/perseus_drlowe_vr_headset.JPG'),

              
              //description of VR headset supplemental materials
              const SizedBox(height: 25),
              const Text(
                "Below are some supplemental documents containing information about the VR headsets."
                " If you have any questions or feedback, please fill out the contact form located on the home page and we will be in touch!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  height: 1.6,
                ),
              ),

              //links to supplemental materials will open in an external browser when clicked
              //General VR Headset Instructions
              const SizedBox(height: 18),
              TextButton.icon(
                //button opens VR headset instructions form in external browser
                onPressed: () async {
                  final uri = Uri.parse(vrHeadsetInstructions);
                  //throws exception if URL cannot be launched
                  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
                    throw Exception('Could not launch $uri');
                    }
                },
                //icon and label to display on the button
                icon: const Icon(Icons.info_rounded),
                label: const Text('VR Headset Instructions'),
              ),

              //Unity Development Guide
              const SizedBox(height: 18),
              TextButton.icon(
                //button opens Unity development guide in external browser
                onPressed: () async {
                  final uri = Uri.parse(unityDevelopmentGuide);
                  //throws exception if URL cannot be launched
                  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
                    throw Exception('Could not launch $uri');
                    }
                },
                //icon and label to display on the button
                icon: const Icon(Icons.book_rounded),
                label: const Text('Unity Development Guide'),
              ),

              //MLC Tech Lending Policies for UGA
              const SizedBox(height: 18),
              TextButton.icon(
                //button opens MLC tech lending policies in external browser
                onPressed: () async {
                  final uri = Uri.parse(mlcTechLending);
                  //throws exception if URL cannot be launched
                  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
                    throw Exception('Could not launch $uri');
                    }
                },
                //icon and label to display on the button
                icon: const Icon(Icons.policy_rounded),
                label: const Text('MLC Tech Lending Policy Page'),
              ),
              
              //description of VR history infographic from PMRC
              //const SizedBox(height: 25),
              //const Text(
              //  "This infographic illustrates the history of virtual reality, from its first prototype to a tool for immersive forestry education at Warnell.",
              //  textAlign: TextAlign.center,
              //  style: TextStyle(
              //    fontSize: 18,
              //    height: 1.6,
              //  ),
              //),

              //const SizedBox(height: 50),
              //Image of VR evolution graphic from UGA PMRC
              //const LazyImage(assetPath: 'lib/assets/images/perseus_vr_evolution_graphic.jpeg'),

            ]
          ),
        ),
      ),
    );
  }
}
