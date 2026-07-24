import 'package:flutter/material.dart';
import 'screens/home/home_page.dart';
import 'screens/vr_materials/vr_materials.dart';
import 'screens/posters_and_publications/posters_and_publications.dart';
import 'screens/intern_updates/intern_updates.dart';
import 'screens/robot/robot.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false,

      initialRoute: '/',

      routes: {
        '/': (context) => const HomePage(),
        '/vr_materials': (context) => const VRMaterials(),
        '/posters_and_publications': (context) => const PostersAndPublications(),
        '/intern_updates': (context) => const InternUpdates(),
        '/robot': (context) => const Robot(),
      },
    );
  }
}