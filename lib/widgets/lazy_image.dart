import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class LazyImage extends StatefulWidget {
  final String assetPath;
  final double height;

  const LazyImage({
    super.key,
    required this.assetPath,
    this.height = 220,
  });

  @override
  State<LazyImage> createState() => _LazyImageState();
}

class _LazyImageState extends State<LazyImage> {
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
