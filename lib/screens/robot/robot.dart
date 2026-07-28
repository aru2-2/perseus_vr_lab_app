import 'package:flutter/material.dart';
import '../../widgets/theme_toggle_button.dart';

class Robot extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const Robot({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Robot"),
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
                "Meet Percy, the Warnell VR Lab Robot!",
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
                "Thank you for visiting the Robot page!"
                " Here, you'll find updates about Percy, our Warnell VR Lab robot!"
                " Percy is a cutting-edge robot designed for research and education."
                " He will explore the UGA campus, collecting LiDAR data and capturing images to create a model of the trees around his home."
                " Percy is still in development, but we are excited to introduce him to you soon!",
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
