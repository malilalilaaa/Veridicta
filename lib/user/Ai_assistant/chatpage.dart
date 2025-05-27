import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:open_court/utils/Pallete.dart';
import 'package:open_court/widgets/ai_assistance/answer_section.dart';
import 'package:open_court/widgets/ai_assistance/side_bar.dart';
import 'package:open_court/widgets/ai_assistance/sources_section.dart';

class ChatPage extends StatelessWidget {
  final String question;
  const ChatPage({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          kIsWeb ? SideBar() : SizedBox(),
          kIsWeb ? const SizedBox(width: 100) : SizedBox(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      question,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                        height: 1.2,
                      ),
                    ),
                    SizedBox(height: 24),
                    SourcesSection(),
                    SizedBox(height: 24),
                    AnswerSection(),
                  ],
                ),
              ),
            ),
          ),
          kIsWeb
              ? Placeholder(strokeWidth: 0, color: Pallete.footer)
              : SizedBox(),
        ],
      ),
    );
  }
}
