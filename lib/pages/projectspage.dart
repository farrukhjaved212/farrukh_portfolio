import 'package:farrukh_portfolio/pages/aboutpage.dart';
import 'package:farrukh_portfolio/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage>
    with SingleTickerProviderStateMixin {
  final projects = [
    {
      "title": "Swish App",
      "description": "A clean and responsive Flutter mobile app design.",
      "images": [
        "https://picsum.photos/id/237/400/700",
        "https://picsum.photos/id/238/400/700",
      ],
    },
    {
      "title": "Crime Loc",
      "description": "Track crime locations with maps and analytics.",
      "images": [
        "https://picsum.photos/id/239/400/700",
        "https://picsum.photos/id/240/400/700",
      ],
    },
    {
      "title": "Grocery App",
      "description": "E-commerce app for grocery shopping and delivery.",
      "images": [
        "https://picsum.photos/id/241/400/700",
        "https://picsum.photos/id/242/400/700",
      ],
    },
  ];

  int? previewIndex;
  int currentImageIndex = 0;

  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _slideAnimation;

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

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );
    _slideAnimation = Tween<double>(begin: -200, end: 0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );
  }

  void openPreview(int index) {
    setState(() {
      previewIndex = index;
      currentImageIndex = 0;
    });
    _animationController.forward(from: 0);
  }

  void closePreview() {
    _animationController.reverse().then((_) {
      setState(() {
        previewIndex = null;
      });
    });
  }

  void nextImage() {
    setState(() {
      currentImageIndex =
          (currentImageIndex + 1) %
          (projects[previewIndex!]["images"] as List).length;
    });
  }

  void previousImage() {
    setState(() {
      currentImageIndex =
          (currentImageIndex -
              1 +
              (projects[previewIndex!]["images"] as List).length) %
          (projects[previewIndex!]["images"] as List).length;
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                          "About",
                          onTap: () => Get.toNamed('/about'),
                          colors: colors,
                        ),

                        const SizedBox(width: 40),
                        _navItem("Contact", colors: colors),
                      ],
                    ),
                  ],
                ),
              ),

              // Centered Project Cards
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: projects.asMap().entries.map((entry) {
                    int index = entry.key;
                    var project = entry.value;
                    return Container(
                      margin: const EdgeInsets.only(bottom: 30),
                      padding: const EdgeInsets.all(20),
                      width: 300,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            colors[3].withOpacity(0.7),
                            colors[5].withOpacity(0.7),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: colors[0].withOpacity(0.3),
                            blurRadius: 12,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            project["title"] as String,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            project["description"] as String,
                            style: GoogleFonts.poppins(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: colors[6],
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              onPressed: () => openPreview(index),
                              child: Text(
                                "View Preview",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),

              // Preview overlay
              if (previewIndex != null)
                Positioned.fill(
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      double slideY = 200 * (1 - _animationController.value);
                      double scale = 0.8 + 0.2 * _animationController.value;
                      return Opacity(
                        opacity: _animationController.value,
                        child: Container(
                          color: Colors.black.withOpacity(
                            0.5 * _animationController.value,
                          ),
                          child: Center(
                            child: Transform.translate(
                              offset: Offset(0, slideY),
                              child: Transform.scale(
                                scale: scale,
                                child: Container(
                                  width: 300,
                                  height: 600,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(50),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.5),
                                        blurRadius: 25,
                                      ),
                                    ],
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        top: 20,
                                        left: 10,
                                        right: 10,
                                        bottom: 20,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            40,
                                          ),
                                          child: Image.network(
                                            (projects[previewIndex!]["images"]
                                                as List<
                                                  String
                                                >)[currentImageIndex],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 5,
                                        top: 0,
                                        bottom: 0,
                                        child: GestureDetector(
                                          onTap: previousImage,
                                          child: const Icon(
                                            Icons.arrow_back_ios,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        right: 5,
                                        top: 0,
                                        bottom: 0,
                                        child: GestureDetector(
                                          onTap: nextImage,
                                          child: const Icon(
                                            Icons.arrow_forward_ios,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 10,
                                        right: 10,
                                        child: GestureDetector(
                                          onTap: closePreview,
                                          child: const Icon(
                                            Icons.close,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
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
