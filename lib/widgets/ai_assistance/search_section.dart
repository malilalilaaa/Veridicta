import 'package:flutter/material.dart';
import 'package:open_court/services/Ai_assistance/chat_web_service.dart';
import 'package:open_court/user/Ai_assistant/chatpage.dart';

import 'package:open_court/utils/Pallete.dart';
import 'package:open_court/widgets/ai_assistance/search_bar_button.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({super.key});

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  final queryController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    queryController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'From Confusion to Clarity',
          style: TextStyle(
            fontSize: 40,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
            height: 1.2,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 32),
        Container(
          width: 700,
          decoration: BoxDecoration(
            color: Pallete.searchBar,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Pallete.searchBarBorder, width: 1.5),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: queryController,
                  decoration: InputDecoration(
                    hintText: 'Search anything...',
                    hintStyle: TextStyle(color: Colors.blueGrey, fontSize: 16),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    SearchBarButton(
                      icon: Icons.auto_awesome_outlined,
                      text: 'Focus',
                      // Add this line to set the text color
                    ),
                    const SizedBox(width: 12),
                    SearchBarButton(
                      icon: Icons.add_circle_outline_outlined,
                      text: 'Attach',
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        ChatWebService().chat(queryController.text.trim());
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder:
                                (context) => ChatPage(
                                  question: queryController.text.trim(),
                                ),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(9),
                        decoration: BoxDecoration(
                          color: Pallete.submitButton,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Color.fromARGB(
                            255,
                            158,
                            189,
                            220,
                          ), // Use a single Color value
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
