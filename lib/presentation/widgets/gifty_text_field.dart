import 'package:flutter/material.dart';
import 'package:gifty_flutter/core/theme/app_colors.dart';

class GiftyTextField extends StatelessWidget {
  final String hintText;
  final TextAlign textAlign;
  final TextEditingController? controller;

  const GiftyTextField({
    super.key,
    required this.hintText,
    this.textAlign = TextAlign.start,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller, // Pass the controller
      textAlign: textAlign,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.background,
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
        contentPadding: const EdgeInsets.only(bottom: 8.0),
      ),
      cursorColor: AppColors.selectedTab,
    );
  }
}
