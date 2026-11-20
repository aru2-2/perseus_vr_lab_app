//import statements
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widgets/lazy_image.dart';
import '../../widgets/settings_button.dart';

//creates the Posters and Publications page of the app
class PostersAndPublications extends StatelessWidget {
  //adds timeline effect to the screen
  static const List<_TimelineEntry> _timelineEntries = [
    //timeline card for Journal of Forestry accepted paper
    _TimelineEntry(
      year: 'September 2026',
      title: 'Journal of Forestry Brief Communication',
      imagePath: 'lib/assets/images/perseus_purdue_picture_2026.jpeg',
      description:
          'Joey, Addy, and Maadhavan wrote an article on virtual forestry education that was accepted by the Journal of Forestry! They explored the capabilities of VR and AR in the classroom. Read more about it here: https://link.springer.com/article/10.1007/s44392-026-00122-8.',
    ),

    //timeline card for Purdue Conference 2026
    _TimelineEntry(
      year: 'June 2026',
      title: 'Purdue University Conference',
      imagePath: 'lib/assets/images/perseus_purdue_poster_2026.jpeg',
      description:
          'Joey, Addy, and Maadhavan presented about the Warnell VR Lab at the Application and Solutions in Digital Forestry International Conference at Purdue University. They showcased the capabilities of our VR Lab as experiential learning in immersive solutions.',
    ),

    //timeline card for CURO at UGA in 2026
    _TimelineEntry(
      year: 'April 2026',
      title: 'CURO 2026 Poster Showcase',
      imagePath: 'lib/assets/images/perseus_curo_picture_2026.jpeg',
      description:
          'Joey, Addy, and Maadhavan presented about forestry education in a virtual world at CURO 2026, showcasing the capabilities of our VR Lab and the potential applications of our research. The poster highlighted their work in 360-degree virtual reality and LiDAR simulations in the classroom.',
    ),

    //timeline card for UGA PERSEUS Annual Meeting 2025
    _TimelineEntry(
      year: 'May 2025',
      title: 'PERSEUS Annual Meeting',
      imagePath: 'lib/assets/images/perseus_uga_presentation_2025.JPG',
      description:
          'Some of the Warnell VR Lab interns presented about forests in a virtual world at the 2025 PERSEUS Annual Meeting at the University of Georgia. Their presentation demonstrated initial research into using virtual reality headsets to advance the PERSEUS Project objectives.',
    ),
  ];

  const PostersAndPublications({super.key});

  //builds the Posters and Publications page widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Warnell VR Lab"),
        centerTitle: true,
        actions: [const SettingsButton()],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Posters and Publications",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                "Explore the collection of posters and publications related to the Warnell VR Lab.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, height: 1.6),
              ),
              const SizedBox(height: 28),
              ...List.generate(
                _timelineEntries.length,
                (index) => _TimelineEntryRow(
                  entry: _timelineEntries[index],
                  isLast: index == _timelineEntries.length - 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//timeline entry class with variables
class _TimelineEntry {
  final String year;
  final String title;
  final String imagePath;
  final String description;

  const _TimelineEntry({
    required this.year,
    required this.title,
    required this.imagePath,
    required this.description,
  });
}

//timeline class
class _TimelineEntryRow extends StatelessWidget {
  final _TimelineEntry entry;
  final bool isLast;

  const _TimelineEntryRow({required this.entry, required this.isLast});

  Future<void> _openLink(BuildContext context, String url) async {
    try {
      if (await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      )) {
        return;
      }
    } on PlatformException {
      // Show the fallback message below.
    } on MissingPluginException {
      // Show the fallback message below.
    }

    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Couldn't open this link. Please try again."),
      ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    final match = RegExp(r'https://[^\s]+').firstMatch(entry.description);
    if (match == null) {
      return Text(
        entry.description,
        textAlign: TextAlign.left,
        style: const TextStyle(fontSize: 17, height: 1.6),
      );
    }

    final linkStartIndex = match.start;
    var linkUrl = match.group(0)!;
    if (linkUrl.endsWith('.') || linkUrl.endsWith(',')) {
      linkUrl = linkUrl.substring(0, linkUrl.length - 1);
    }
    final descriptionAfterLink = entry.description.substring(
      linkStartIndex + linkUrl.length,
    );

    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        style: const TextStyle(fontSize: 17, height: 1.6, color: Colors.black),
        children: [
          TextSpan(text: entry.description.substring(0, linkStartIndex)),
          TextSpan(
            text: linkUrl,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => _openLink(context, linkUrl),
          ),
          TextSpan(text: descriptionAfterLink),
        ],
      ),
    );
  }

  //builds the widget including visual elements of the timeline on the screen
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: 36,
              child: Column(
                children: [
                  Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                  ),
                  if (!isLast)
                    Expanded(
                      child: Container(
                        width: 2,
                        margin: const EdgeInsets.only(top: 8),
                        color: Theme.of(context).dividerColor,
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: colorScheme.outline, width: 1.2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entry.year,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        entry.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 16),
                      LazyImage(assetPath: entry.imagePath),
                      const SizedBox(height: 16),
                      _buildDescription(context),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
