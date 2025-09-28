import 'package:flutter/material.dart';
import 'package:gifty_flutter/core/theme/app_colors.dart';
import 'package:gifty_flutter/presentation/widgets/gifty_button.dart';
import 'package:gifty_flutter/presentation/widgets/gifty_text_field.dart';

class NicknamePage extends StatefulWidget {
  const NicknamePage({super.key});

  @override
  State<NicknamePage> createState() => _NicknamePageState();
}

class _NicknamePageState extends State<NicknamePage> {
  final _textController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _textController.addListener(() {
      setState(() {
        _isButtonEnabled = _textController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 49.0),
        child: Column(
          children: [
            const SizedBox(height: 271), // Adjusted height to make space for button
            const Text(
              '사용하실 닉네임을 입력해주세요!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'MemomentKkukkkuk',
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 40),
            GiftyTextField(
              controller: _textController,
              hintText: '닉네임 입력',
              textAlign: TextAlign.center,
            ),
            const Spacer(), // Pushes the button to the bottom
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: GiftyButton(
                buttonText: '저장',
                isEnabled: _isButtonEnabled,
                buttonTap: () {
                  // Handle save action
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
