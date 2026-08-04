//import statements
import 'package:flutter/material.dart';
import '../../widgets/lazy_image.dart';
import '../../widgets/theme_toggle_button.dart';

//creates the Posters and Publications page of the app
class PostersAndPublications extends StatelessWidget {
  //adds timeline effect to the screen
  static const List<_TimelineEntry> _timelineEntries = [
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

  //toggles between light and dark mode
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const PostersAndPublications({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

//builds the Posters and Publications page widget
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
              const Text(
                "Posters and Publications",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Explore the collection of posters and publications related to the Warnell VR Lab.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  height: 1.6,
                ),
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

  const _TimelineEntryRow({
    required this.entry,
    required this.isLast,
  });

  //builds the widget including visual elements of the timeline on the screen
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 36,
            child: Column(
              children: [
                Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                ),
                if (!isLast)
                  Container(
                    width: 2,
                    height: 300,
                    margin: const EdgeInsets.only(top: 8),
                    color: Theme.of(context).dividerColor,
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
                        color: Theme.of(context).colorScheme.primary,
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
                    Text(
                      entry.description,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 17,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
