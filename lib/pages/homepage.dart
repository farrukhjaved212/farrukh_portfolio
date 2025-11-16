import 'package:farrukh_portfolio/pages/aboutpage.dart';
import 'package:farrukh_portfolio/pages/projectspage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController reviewController = TextEditingController();

  final RxList<Map<String, String>> reviews = <Map<String, String>>[
    {
      "stars": "⭐️⭐️⭐️⭐️⭐️",
      "review": "Fantastic work! Exceeded my expectations.",
    },
    {"stars": "⭐️⭐️⭐️⭐️", "review": "Great communication and timely delivery."},
    {"stars": "⭐️⭐️⭐️⭐️⭐️", "review": "Creative design and smooth animations!"},
  ].obs;

  @override
  void dispose() {
    nameController.dispose();
    reviewController.dispose();
    super.dispose();
  }

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
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 800;

          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: colors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Navbar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _navItem(
                          "Projects",
                          onTap: () => Get.toNamed('/projects'),
                          colors: colors,
                        ),
                        const SizedBox(width: 20),
                        _navItem(
                          "About",
                          onTap: () => Get.toNamed('/about'),
                          colors: colors,
                        ),
                        const SizedBox(width: 20),
                        _navItem("Contact", colors: colors),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Hero Section
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedTextKit(
                        repeatForever: true,
                        animatedTexts: [
                          TypewriterAnimatedText(
                            '🚀 Flutter Developer',
                            textStyle: GoogleFonts.poppins(
                              fontSize: isMobile ? 24 : 36,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            speed: const Duration(milliseconds: 120),
                          ),
                          TypewriterAnimatedText(
                            '🛠 QA Engineer',
                            textStyle: GoogleFonts.poppins(
                              fontSize: isMobile ? 24 : 36,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            speed: const Duration(milliseconds: 120),
                          ),
                          TypewriterAnimatedText(
                            '📱 Building Beautiful Apps & Web',
                            textStyle: GoogleFonts.poppins(
                              fontSize: isMobile ? 20 : 32,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                            speed: const Duration(milliseconds: 120),
                          ),
                          TypewriterAnimatedText(
                            '💼 1 Year Experience in Fintech',
                            textStyle: GoogleFonts.poppins(
                              fontSize: isMobile ? 16 : 28,
                              color: Colors.white70,
                              fontWeight: FontWeight.w500,
                            ),
                            speed: const Duration(milliseconds: 120),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      InkWell(
                        onTap: () => Get.toNamed('/projects'),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 12,
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
                              fontSize: isMobile ? 14 : 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  // Client Reviews + Submit
                  isMobile
                      ? Column(
                          children: [
                            _clientReview(colors, isMobile),
                            const SizedBox(height: 20),
                            _submitReview(colors, isMobile),
                          ],
                        )
                      : Row(
                          children: [
                            Expanded(child: _clientReview(colors, isMobile)),
                            const SizedBox(width: 20),
                            Expanded(child: _submitReview(colors, isMobile)),
                          ],
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _clientReview(List<Color> colors, bool isMobile) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [colors[2], colors[5]],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      height: isMobile ? 250 : 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Client Reviews",
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 20 : 26,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: Obx(
              () => ListView(
                children: reviews
                    .map((r) => _reviewCard(r["stars"]!, r["review"]!))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _submitReview(List<Color> colors, bool isMobile) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [colors[2], colors[5]],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      height: isMobile ? 300 : 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Submit Your Review",
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 20 : 26,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          _inputField("Your Name", controller: nameController),
          const SizedBox(height: 10),
          _inputField("Your Review", controller: reviewController),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                if (nameController.text.isNotEmpty &&
                    reviewController.text.isNotEmpty) {
                  reviews.add({
                    "stars": "⭐️⭐️⭐️⭐️⭐️",
                    "review":
                        "${nameController.text}: ${reviewController.text}",
                  });
                  nameController.clear();
                  reviewController.clear();
                  Get.snackbar(
                    "Success",
                    "Your review has been submitted!",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.white.withOpacity(0.2),
                    colorText: Colors.white,
                  );
                } else {
                  Get.snackbar(
                    "Error",
                    "Please fill both fields",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.red.withOpacity(0.2),
                    colorText: Colors.white,
                  );
                }
              },
              borderRadius: BorderRadius.circular(30),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [colors[2], colors[5]]),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.2),
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
                    fontSize: isMobile ? 14 : 16,
                  ),
                ),
              ),
            ),
          ),
        ],
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
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
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
        style: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
      ),
    );
  }

  Widget _inputField(String hint, {TextEditingController? controller}) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      cursorColor: Colors.white,
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
          horizontal: 12,
          vertical: 10,
        ),
      ),
    );
  }
}
