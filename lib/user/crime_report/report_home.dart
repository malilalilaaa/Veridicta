import 'package:flutter/material.dart';
import 'package:open_court/utils/Pallete.dart';
import 'package:open_court/widgets/crime_report/Report_center.dart';
import 'package:open_court/widgets/crime_report/sidebar.dart';

class Report_Home extends StatefulWidget {
  const Report_Home({super.key});

  @override
  State<Report_Home> createState() => _Report_HomeState();
}

class _Report_HomeState extends State<Report_Home> {
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
                  Report_SideBar(),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Expanded(child: Report_Center()),

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
