import 'package:flutter/material.dart';
import 'package:open_court/utils/Pallete.dart';
import 'package:open_court/widgets/ai_assistance/search_section.dart';
import 'package:open_court/widgets/ai_assistance/side_bar.dart';

class Ai_Home extends StatelessWidget {
  const Ai_Home({super.key});

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

                          // Container(
                          //   padding: EdgeInsets.symmetric(vertical: 16),
                          //   child: Wrap(
                          //     alignment: WrapAlignment.center,
                          //     children: [
                          //       Padding(
                          //         padding: EdgeInsets.symmetric(horizontal: 12),
                          //         child: Text(
                          //           "Pro",
                          //           style: TextStyle(
                          //             fontSize: 14,
                          //             color: AppColors.footerGrey,
                          //           ),
                          //         ),
                          //       ),
                          //       Padding(
                          //         padding: EdgeInsets.symmetric(horizontal: 12),
                          //         child: Text(
                          //           "Enterprise",
                          //           style: TextStyle(
                          //             fontSize: 14,
                          //             color: AppColors.footerGrey,
                          //           ),
                          //         ),
                          //       ),
                          //       Padding(
                          //         padding: EdgeInsets.symmetric(horizontal: 12),
                          //         child: Text(
                          //           "Store",
                          //           style: TextStyle(
                          //             fontSize: 14,
                          //             color: AppColors.footerGrey,
                          //           ),
                          //         ),
                          //       ),
                          //       Padding(
                          //         padding: EdgeInsets.symmetric(horizontal: 12),
                          //         child: Text(
                          //           "Blog",
                          //           style: TextStyle(
                          //             fontSize: 14,
                          //             color: AppColors.footerGrey,
                          //           ),
                          //         ),
                          //       ),
                          //       Padding(
                          //         padding: EdgeInsets.symmetric(horizontal: 12),
                          //         child: Text(
                          //           "Careers",
                          //           style: TextStyle(
                          //             fontSize: 14,
                          //             color: AppColors.footerGrey,
                          //           ),
                          //         ),
                          //       ),
                          //       Padding(
                          //         padding: EdgeInsets.symmetric(horizontal: 12),
                          //         child: Text(
                          //           "English (English)",
                          //           style: TextStyle(
                          //             fontSize: 14,
                          //             color: AppColors.footerGrey,
                          //           ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
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
