import 'package:farrukh_portfolio/pages/aboutpage.dart';
import 'package:farrukh_portfolio/pages/projectspage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 🔝 Navbar with extra spacing
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _navItem(
                    "Projects",
                    onTap: () => Get.toNamed('/projects'),
                    colors: colors,
                  ),
                  const SizedBox(width: 40),
                  _navItem(
                    "About",
                    onTap: () => Get.toNamed('/about'),
                    colors: colors,
                  ),

                  const SizedBox(width: 40),
                  _navItem("Contact", colors: colors),
                ],
              ),
            ),

            // 💬 Hero Section
            Expanded(
              flex: 2,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        TypewriterAnimatedText(
                          '🚀 Flutter Developer',
                          textStyle: GoogleFonts.poppins(
                            fontSize: 36,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          speed: const Duration(milliseconds: 120),
                        ),
                        TypewriterAnimatedText(
                          '🛠 QA Engineer',
                          textStyle: GoogleFonts.poppins(
                            fontSize: 36,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          speed: const Duration(milliseconds: 120),
                        ),
                        TypewriterAnimatedText(
                          '📱 Building Beautiful Apps & Web',
                          textStyle: GoogleFonts.poppins(
                            fontSize: 32,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          speed: const Duration(milliseconds: 120),
                        ),
                        TypewriterAnimatedText(
                          '💼 1 Year Experience in Fintech',
                          textStyle: GoogleFonts.poppins(
                            fontSize: 28,
                            color: Colors.white70,
                            fontWeight: FontWeight.w500,
                          ),
                          speed: const Duration(milliseconds: 120),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    InkWell(
                      onTap: () {
                        Get.toNamed('/projects');
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 15,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [colors[3], colors[6]],
                          ),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.4),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Text(
                          "Click to see Projects",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 💬 Client Reviews + Submit Section
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Row(
                  children: [
                    // Left – Reviews
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(
                            255,
                            255,
                            248,
                            248,
                          ).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(
                                255,
                                255,
                                255,
                                255,
                              ).withOpacity(0.2),
                              blurRadius: 15,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            Text(
                              "Client Reviews",
                              style: GoogleFonts.poppins(
                                fontSize: 26,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Expanded(
                              child: ListView(
                                children: [
                                  _reviewCard(
                                    "⭐️⭐️⭐️⭐️⭐️",
                                    "Fantastic work! Exceeded my expectations.",
                                  ),
                                  _reviewCard(
                                    "⭐️⭐️⭐️⭐️",
                                    "Great communication and timely delivery.",
                                  ),
                                  _reviewCard(
                                    "⭐️⭐️⭐️⭐️⭐️",
                                    "Creative design and smooth animations!",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 20),

                    // Right – Submit Form
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              colors[2],
                              colors[5],
                            ], // Right panel gradient
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(
                                255,
                                247,
                                228,
                                228,
                              ).withOpacity(0.2),
                              blurRadius: 15,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            Text(
                              "Submit Your Review",
                              style: GoogleFonts.poppins(
                                fontSize: 26,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            _inputField("Your Name"),
                            const SizedBox(height: 15),
                            _inputField("Your Review"),
                            const SizedBox(height: 25),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 15,
                                ),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [colors[3], colors[7]],
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color.fromARGB(
                                        255,
                                        236,
                                        192,
                                        192,
                                      ).withOpacity(0.2),
                                      blurRadius: 10,
                                      offset: const Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: Text(
                                  "Submit",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
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

  Widget _reviewCard(String stars, String review) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Text(
        "$stars  $review",
        style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
      ),
    );
  }

  Widget _inputField(String hint) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white70),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(15),
        ),
        fillColor: Colors.white.withOpacity(0.1),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 12,
        ),
      ),
    );
  }
}
