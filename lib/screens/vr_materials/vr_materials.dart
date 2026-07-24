import 'package:flutter/material.dart';

class VRMaterials extends StatelessWidget {
  const VRMaterials({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("VR Materials"),
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

              // Image
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
               // child: Image.asset(
               //   'assets/images/vr_lab_demo.jpg',
               //   width: double.infinity,
               //   height: 250,
               //   fit: BoxFit.cover,
              //  ),
              ),

              const SizedBox(height: 25),

              // Description
              const Text(
                "Thank you for visiting the VR Materials page!"
                " Here, you'll find a collection of resources and materials related to the Warnell VR Lab. "
                "You can use this area to describe the content of the page, "
                "provide instructions, or display information about the image "
                "shown above. The text automatically wraps to multiple lines "
                "and remains readable on different screen sizes.",
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
