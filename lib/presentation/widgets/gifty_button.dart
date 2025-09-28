import 'package:flutter/material.dart';
import 'package:gifty_flutter/core/theme/app_colors.dart';

class GiftyButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? buttonTap;
  final bool isEnabled;
  final double height;

  const GiftyButton({
    super.key,
    required this.buttonText,
    this.buttonTap,
    this.isEnabled = true,
    this.height = 47.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity, // Stretch to full width
      child: ElevatedButton(
        onPressed: isEnabled ? buttonTap : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.inputAfterButtonBg,
          disabledBackgroundColor: AppColors.inputBeforeButtonBg,
          foregroundColor: AppColors.inputAfterButton,
          disabledForegroundColor: AppColors.inputBeforeButton,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          textStyle: const TextStyle(
            fontFamily: 'MemomentKkukkkuk',
            fontSize: 23,
          ),
          elevation: 0, // To match the iOS look
        ),
        child: Text(buttonText),
      ),
    );
  }
}
