import 'package:flutter/material.dart';
import 'package:gifty_flutter/core/theme/app_colors.dart';
import 'package:gifty_flutter/presentation/widgets/gifty_text_field.dart';

class NicknamePage extends StatelessWidget {
  const NicknamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 49.0),
        child: Column(
          children: [
            const SizedBox(height: 320),
            const Text(
              '사용하실 닉네임을 입력해주세요!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'MemomentKkukkkuk',
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 40), // Spacing between title and text field
            const GiftyTextField(
              hintText: '닉네임 입력',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
