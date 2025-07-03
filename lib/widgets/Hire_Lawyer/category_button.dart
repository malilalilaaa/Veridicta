import 'package:flutter/material.dart';
import 'package:open_court/utils/Pallete.dart';

class SectionRow extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final VoidCallback onPressed;

  const SectionRow({
    super.key,
    required this.title,
    this.buttonTitle = "See All",
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Pallete.footer,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          InkWell(
            onTap: onPressed,
            child: Text(
              buttonTitle,
              style: TextStyle(
                color: Pallete.footer,
                fontSize: 12,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
