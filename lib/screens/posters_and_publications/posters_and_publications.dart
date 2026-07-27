import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class LazyPosterImage extends StatefulWidget {
  final String assetPath;

  const LazyPosterImage({super.key, required this.assetPath});

  @override
  State<LazyPosterImage> createState() => _LazyPosterImageState();
}

class _LazyPosterImageState extends State<LazyPosterImage> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.assetPath),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1 && !_isVisible) {
          setState(() {
            _isVisible = true;
          });
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: SizedBox(
          width: double.infinity,
          height: 220,
          child: _isVisible
              ? Image.asset(
                  widget.assetPath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      alignment: Alignment.center,
                      child: const Text('Image unavailable'),
                    );
                  },
                )
              : Container(
                  color: Colors.grey[200],
                  alignment: Alignment.center,
                  child: const Text('Loading image...'),
                ),
        ),
      ),
    );
  }
}

class PostersAndPublications extends StatelessWidget {
  const PostersAndPublications({super.key});

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
                "Thank you for visiting the Posters and Publications page!" 
                " Here, you'll find a collection of posters and publications related to the Warnell VR Lab.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 18,
                  height: 1.6,
                ),
              ),
      
              
              const SizedBox(height: 25),
              // Image of Purdue poster presentation in 2026
              LazyPosterImage(assetPath: 'lib/assets/images/perseus_purdue_poster_2026.jpeg'),


              const SizedBox(height: 25),
              // Description of Purdue poster presentation in 2026
              const Text(
                "Joey, Addy, and Maadhavan presented about the Warnell VR Lab at the Application and Solutions in Digital Forestry International Conference at Purdue University."
                " They showcased the capabilities of our VR Lab as experiential learning in immersive solutions."
                " (fix and add more details)",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 18,
                  height: 1.6,
                ),
              ),
              
              const SizedBox(height: 25),
              // Image of PERSEUS poster presentation at CURO 2026
              LazyPosterImage(assetPath: 'lib/assets/images/perseus_curo_picture_2026.jpeg'),


              const SizedBox(height: 25),
              // Description of CURO 2026 poster presentation
              const Text(
                "Joey, Addy, and Maadhavan presented about forestry education in a virtual world at CURO 2026, showcasing the capabilities of our VR Lab and the potential applications of our research." 
                " The poster highlighted their work in 360-degree virtual reality and LiDAR simulations in the classroom."
                " (fix and add more details)",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 18,
                  height: 1.6,
                ),
              ),

              const SizedBox(height: 25),
              // Image of UGA presentation in 2025
              LazyPosterImage(assetPath: 'lib/assets/images/perseus_uga_presentation_2025.jpeg'),


              const SizedBox(height: 25),
              // Description of UGA presentation in 2025
              const Text(
                "Maadhavan presented about forests in a virtual world at the 2025 PERSEUS Annual Meeting at the University of Georgia." 
                " His presentation demonstrated initial research into using virtual reality headsets to advance the PERSEUS Project objectives."
                " (fix and add more details)",
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
