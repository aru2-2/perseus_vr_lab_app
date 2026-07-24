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
                text: "Page One",
                icon: Icons.looks_one,
                onPressed: () {
                  Navigator.pushNamed(context, "/page1");
                },
              ),

              const SizedBox(height: 15),

              CustomButton(
                text: "Page Two",
                icon: Icons.looks_two,
                onPressed: () {
                  Navigator.pushNamed(context, "/page2");
                },
              ),

              const SizedBox(height: 15),

              CustomButton(
                text: "Page Three",
                icon: Icons.looks_3,
                onPressed: () {
                  Navigator.pushNamed(context, "/page3");
                },
              ),

              const SizedBox(height: 15),

              CustomButton(
                text: "Page Four",
                icon: Icons.looks_4,
                onPressed: () {
                  Navigator.pushNamed(context, "/page4");
                },
              ),

              const SizedBox(height: 15),

              CustomButton(
                text: "Page Five",
                icon: Icons.looks_5,
                onPressed: () {
                  Navigator.pushNamed(context, "/page5");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}