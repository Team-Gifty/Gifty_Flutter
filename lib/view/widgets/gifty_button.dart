import 'package:flutter/material.dart';
import 'package:gifty_flutter/core/theme/app_colors.dart';

class GiftyButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? buttonTap;
  final bool isEnabled;
  final double height;
  final Color? backgroundColor;
  final double? borderRadius;

  const GiftyButton({
    super.key,
    required this.buttonText,
    this.buttonTap,
    this.isEnabled = true,
    this.height = 47.0,
    this.backgroundColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isEnabled ? buttonTap : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.inputAfterButtonBg,
          disabledBackgroundColor: AppColors.inputBeforeButtonBg,
          foregroundColor: AppColors.inputAfterButton,
          disabledForegroundColor: AppColors.inputBeforeButton,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
          ),
          textStyle: const TextStyle(
            fontFamily: 'MemomentKkukkkuk',
            fontSize: 23,
          ),
          elevation: 0,
        ),
        child: Text(buttonText),
      ),
    );
  }
}
