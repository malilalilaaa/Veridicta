import 'package:flutter/material.dart';
import 'package:open_court/utils/Pallete.dart';

class User_Dashboard extends StatelessWidget {
  const User_Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Dashboard",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Pallete.cardColor,
                      ),
                    ),
                    Icon(Icons.notifications, color: Pallete.cardColor),
                  ],
                ),
                const SizedBox(height: 10),

                // Welcome section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Expanded(
                      child: Text(
                        "Welcome Shafwat Mahiya",
                        style: TextStyle(fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Profile",
                      style: TextStyle(fontSize: 14, color: Pallete.cardColor),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Next report card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: Pallete.bg,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Next Report",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Women fell victim to theft\nCivilians take matter to own hands",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(
                                  Icons.timer,
                                  color: Colors.white,
                                  size: 18,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "10 min",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 25,
                        child: Icon(Icons.play_arrow, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // For You Section
                const Text(
                  "For You",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 15),

                // Responsive Grid
                LayoutBuilder(
                  builder: (context, constraints) {
                    int crossAxisCount = width < 400 ? 2 : 3;
                    double childAspectRatio = width < 400 ? 0.9 : 1.2;

                    return GridView.count(
                      crossAxisCount: crossAxisCount,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: childAspectRatio,
                      children: const [
                        FocusAreaCard(
                          title: "Report",
                          image: AssetImage("assets/report_crime.png"),
                        ),
                        FocusAreaCard(
                          title: "Hire Lawyer",
                          image: AssetImage("assets/hire_lawyer.png"),
                        ),
                        FocusAreaCard(
                          title: "AI Assistant",
                          image: AssetImage("assets/ai_assist.png"),
                        ),
                        FocusAreaCard(
                          title: "NGO Help",
                          image: AssetImage("assets/probono.png"),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FocusAreaCard extends StatelessWidget {
  final String title;
  final IconData? icon;
  final ImageProvider? image;

  const FocusAreaCard({super.key, required this.title, this.icon, this.image});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageSize =
        screenWidth * 0.18; // scale image size based on screen width

    Widget iconWidget;

    if (image != null) {
      iconWidget = Image(
        image: image!,
        width: imageSize,
        height: imageSize,
        fit: BoxFit.contain,
      );
    } else if (icon != null) {
      iconWidget = Icon(icon, size: 40, color: Colors.blue);
    } else {
      iconWidget = const SizedBox();
    }

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5FA),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconWidget,
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
