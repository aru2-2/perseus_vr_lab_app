//import statements
import 'package:flutter/material.dart';
import '../../widgets/lazy_image.dart';

class VRMaterials extends StatelessWidget {
  const VRMaterials({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Warnell VR Lab"),
        centerTitle: true,
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
                "The Warnell VR Lab interns have created a YouTube page for 360-degree forestry videos."
                " You can check out VR headsets for yourself or a group of people using the checkout form and supplemental documents below.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 18,
                  height: 1.6,
                ),
              ),

              const SizedBox(height: 25),
              //Image of VR evolution graphic from UGA PMRC
              const LazyImage(assetPath: 'lib/assets/images/perseus_vr_evolution_graphic.jpeg'),

            ],
          ),
        ),
      ),
    );
  }
}
