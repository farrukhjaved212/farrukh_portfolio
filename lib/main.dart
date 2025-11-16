import 'package:farrukh_portfolio/pages/aboutpage.dart';
import 'package:farrukh_portfolio/pages/homepage.dart';
import 'package:farrukh_portfolio/pages/projectspage.dart';
import 'package:farrukh_portfolio/pages/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  setUrlStrategy(PathUrlStrategy()); // Clean URLs: no "/#/"
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Muhammad Farrukh Javed Portfolio',
      theme: ThemeData(useMaterial3: true),

      // ✅ Routing setup for Flutter Web
      initialRoute: '/splashscreen',

      getPages: [
        GetPage(name: '/splashscreen', page: () => const SplashScreen()),
        GetPage(name: '/home', page: () => const HomePage()),
        GetPage(name: '/about', page: () => const AboutPage()),
        GetPage(name: '/projects', page: () => const ProjectsPage()),
        // You can add more routes here like:
        // GetPage(name: '/projects', page: () => const ProjectsPage()),
      ],
    );
  }
}
