//import statements
import 'package:flutter/material.dart';
import '../../widgets/lazy_image.dart';
import '../../widgets/theme_toggle_button.dart';

//creates the Meet the Team class
class MeetTheTeam extends StatelessWidget {

  //toggles between light and dark mode
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const MeetTheTeam({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  //builds the Meet the Team page widget
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
                "Meet the Team",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 25),
              // Description of overall page content
              const Text(
                "Meet the Warnell VR Lab intern team!",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 18,
                  height: 1.6,
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
