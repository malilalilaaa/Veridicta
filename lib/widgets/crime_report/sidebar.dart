import 'package:flutter/material.dart';
import 'package:open_court/utils/Pallete.dart';
import 'package:open_court/widgets/ai_assistance/side_bar_button.dart';

class Report_SideBar extends StatefulWidget {
  const Report_SideBar({super.key});

  @override
  State<Report_SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<Report_SideBar> {
  bool isCollapsed = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      width: isCollapsed ? 50 : 150,
      color: Pallete.sideNav,
      child: Column(
        children: [
          const SizedBox(height: 16),
          isCollapsed
              ? Image.asset('assets/logo.png', width: 30, height: 30)
              : Image.asset('assets/logo.png', width: 60, height: 60),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  isCollapsed
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                SideBarButton(
                  isCollapsed: isCollapsed,
                  icon: Icons.add,
                  text: "Submit Report",
                ),
                SideBarButton(
                  isCollapsed: isCollapsed,
                  icon: Icons.track_changes,
                  text: "Track Report",
                ),
                SideBarButton(
                  isCollapsed: isCollapsed,
                  icon: Icons.help,
                  text: "How it works",
                ),
                SideBarButton(
                  isCollapsed: isCollapsed,
                  icon: Icons.book,
                  text: "Resources",
                ),
                SideBarButton(
                  isCollapsed: isCollapsed,
                  icon: Icons.contact_page,
                  text: "Contact Us",
                ),
                const Spacer(),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isCollapsed = !isCollapsed;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              margin: EdgeInsets.symmetric(vertical: 14),
              child: Icon(
                isCollapsed
                    ? Icons.keyboard_arrow_right
                    : Icons.keyboard_arrow_left,
                color: Colors.white,
                size: 22,
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
