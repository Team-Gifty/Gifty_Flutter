import 'package:flutter/material.dart';
import 'package:gifty_flutter/core/theme/app_colors.dart';
import 'package:gifty_flutter/presentation/widgets/gifty_text_field.dart';

class NicknamePage extends StatelessWidget {
  const NicknamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 42.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
            const SizedBox(height: 40),
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
