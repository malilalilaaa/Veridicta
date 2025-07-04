import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
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
                      "Training",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.calendar_today_outlined),
                  ],
                ),
                SizedBox(height: 10),

                // Your program section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Your program", style: TextStyle(fontSize: 16)),
                    Text(
                      "Details",
                      style: TextStyle(fontSize: 14, color: Colors.blue),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Next workout card
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF6A5AE0), Color(0xFF60A1F1)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Next workout",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Legs Toning\nand Glutes Workout",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.timer, color: Colors.white, size: 18),
                              SizedBox(width: 5),
                              Text(
                                "60 min",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 25,
                        child: Icon(Icons.play_arrow, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                // Motivation banner
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Color(0xFFF1F6FF),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.directions_run, color: Colors.blue),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "You are doing great",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Keep it up\nStick to your plan",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),

                // Area of focus title
                const Text(
                  "Area of focus",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 15),

                // Focus area grid
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1.1,
                  children: const [
                    FocusAreaCard(title: "Glutes", icon: Icons.fitness_center),
                    FocusAreaCard(title: "Abs", icon: Icons.accessibility_new),
                    FocusAreaCard(title: "Arms", icon: Icons.pan_tool_alt),
                    FocusAreaCard(title: "Legs", icon: Icons.directions_walk),
                  ],
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
  final IconData icon;

  const FocusAreaCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF5F5FA),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.blue),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
