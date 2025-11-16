import 'package:farrukh_portfolio/pages/homepage.dart';
import 'package:farrukh_portfolio/pages/projectspage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = const [
      Color(0xFF6A6DFF),
      Color(0xFF7579FF),
      Color(0xFF817EFF),
      Color(0xFF8D83FF),
      Color(0xFF9888FF),
      Color(0xFFA38EFF),
      Color(0xFFAE93FF),
      Color(0xFFB999FF),
      Color(0xFFC49EFF),
    ];

    // List of skills
    final skills = [
      "Flutter",
      "Dart",
      "Firebase",
      "REST APIs",
      "UI/UX Design",
      "Quality Assurance",
      "Git & GitHub",
      "Agile Methodology",
    ];

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Left: Back arrow / Dashboard
                    InkWell(
                      onTap: () => Get.toNamed('/home'),

                      child: Row(
                        children: const [
                          Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Right: Nav Items
                    Row(
                      children: [
                        _navItem(
                          "Home",
                          onTap: () => Get.toNamed('/home'),
                          colors: colors,
                        ),
                        const SizedBox(width: 40),
                        _navItem(
                          "Projects",
                          onTap: () => Get.toNamed('/projects'),
                          colors: colors,
                        ),

                        const SizedBox(width: 40),
                        _navItem("Contact", colors: colors),
                      ],
                    ),
                  ],
                ),
              ),
              // Centered description + skills
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Brief description
                      Text(
                        "Hi, I’m Muhammad Farrukh Javed — a passionate Flutter Developer & QA Engineer. I love crafting smooth, responsive apps with clean code and elegant designs.",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Colors.white,
                          height: 1.6,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 30),

                      // Skills section
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        alignment: WrapAlignment.center,
                        children: skills
                            .map(
                              (skill) => Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.3),
                                  ),
                                ),
                                child: Text(
                                  skill,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 40),

                      // Fun animated text (optional)
                      Text(
                        "I build apps. I ensure quality. I innovate.",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.white70,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _navItem(
  String title, {
  VoidCallback? onTap,
  required List<Color> colors,
}) {
  return InkWell(
    onTap: onTap,
    child: Text(
      title,
      style: GoogleFonts.poppins(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
    ),
  );
}
