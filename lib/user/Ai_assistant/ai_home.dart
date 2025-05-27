import 'package:flutter/material.dart';
import 'package:open_court/services/chat_web_service.dart';
import 'package:open_court/utils/Pallete.dart';
import 'package:open_court/widgets/ai_assistance/search_section.dart';
import 'package:open_court/widgets/ai_assistance/side_bar.dart';

class Ai_Home extends StatefulWidget {
  const Ai_Home({super.key});

  @override
  State<Ai_Home> createState() => _Ai_HomeState();
}

class _Ai_HomeState extends State<Ai_Home> {
  @override
  void initState() {
    super.initState();
    ChatWebService().connect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: Pallete.bg),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  SideBar(),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Expanded(child: SearchSection()),

                          Container(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: Text(
                                    "Privacy Policy",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Pallete.footer,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: Text(
                                    "Terms of Service",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Pallete.footer,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: Text(
                                    "Disclaimer ",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Pallete.footer,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: Text(
                                    "Cookie Policy",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Pallete.footer,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: Text(
                                    "Responsible AI Use",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Pallete.footer,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: Text(
                                    "English (English)",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Pallete.footer,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
