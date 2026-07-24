import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My App"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 30),

              const Text(
                "Welcome!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                "Choose one of the options below to continue.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 40),

              CustomButton(
                text: "VR Materials",
                icon: Icons.looks_one,
                onPressed: () {
                  Navigator.pushNamed(context, "/vr_materials");
                },
              ),

              const SizedBox(height: 15),

              CustomButton(
                text: "Posters and Publications",
                icon: Icons.looks_two,
                onPressed: () {
                  Navigator.pushNamed(context, "/posters_and_publications");
                },
              ),

              const SizedBox(height: 15),

              CustomButton(
                text: "Intern Updates",
                icon: Icons.looks_3,
                onPressed: () {
                  Navigator.pushNamed(context, "/intern_updates");
                },
              ),

              const SizedBox(height: 15),

              CustomButton(
                text: "Robot",
                icon: Icons.looks_4,
                onPressed: () {
                  Navigator.pushNamed(context, "/robot");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}