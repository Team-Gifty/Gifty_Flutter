import 'package:flutter/material.dart';
import 'package:gifty_flutter/core/theme/app_colors.dart';

class GiftyTextField extends StatelessWidget {
  final String hintText;
  final TextAlign textAlign;

  const GiftyTextField({
    super.key,
    required this.hintText,
    this.textAlign = TextAlign.start, // Default to start
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: textAlign, // Apply text alignment
      decoration: InputDecoration(
        filled: true, // Set filled to true
        fillColor: AppColors.background, // Set the background color
        hintText: hintText,
        hintStyle: const TextStyle(
          fontFamily: 'MemomentKkukkkuk',
          fontSize: 20,
          color: AppColors.hintText,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.selectedTab,
            width: 2.0,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.selectedTab,
            width: 2.0,
          ),
        ),
        // To create space between the text/hint and the underline
        contentPadding: const EdgeInsets.only(bottom: 8.0),
      ),
      cursorColor: AppColors.selectedTab,
    );
  }
}