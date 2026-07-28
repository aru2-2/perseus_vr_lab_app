//import statements
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

//creates smoother, dynamically loaded images across the app
class LazyImage extends StatefulWidget {
  final String assetPath;
  final double height;

//constructor for the LazyImage class
  const LazyImage({
    super.key,
    required this.assetPath,
    this.height = 220,
  });

  @override
  State<LazyImage> createState() => _LazyImageState();
}

//state class for the LazyImage class
class _LazyImageState extends State<LazyImage> {
  bool _isVisible = false;

//builds the LazyImage widget with specified asset path and height, and handles visibility detection for lazy loading
  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      //if the image is visible, it will load the image, otherwise it will show a placeholder
      key: Key(widget.assetPath),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1 && !_isVisible) {
          setState(() {
            _isVisible = true;
          });
        }
      },
      //builds the image widget with a rounded rectangle border and specified height, and handles error cases for image loading
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: SizedBox(
          width: double.infinity,
          height: widget.height,
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
