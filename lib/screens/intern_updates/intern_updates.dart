//import statements
import 'package:flutter/material.dart';
import '../../widgets/lazy_image.dart';

class InternUpdates extends StatelessWidget {
  const InternUpdates({super.key});

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
                "Thank you for visiting the Intern Updates page!"
                " Here, you'll find the latest information and updates about the Warnell VR Lab interns. ",
                textAlign: TextAlign.justify,
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
                "This image showcases the VR equipment used by the Warnell VR Lab interns to capture tree imagery at Whitehall Forest.(fix description)",
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
