import 'package:flutter/material.dart';
import 'package:gifty_flutter/core/theme/app_colors.dart';
import 'package:gifty_flutter/view/Home/Home_page.dart';
import 'package:gifty_flutter/view/widgets/gifty_button.dart';
import 'package:gifty_flutter/view/widgets/gifty_text_field.dart';
import 'package:gifty_flutter/view_model/nickname_view_model.dart';
import 'package:provider/provider.dart';

class NicknamePage extends StatelessWidget {
  const NicknamePage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<NicknameViewModel>(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 320),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.0),
              child: Text(
                '사용하실 닉네임을 입력해주세요!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'MemomentKkukkkuk',
                  fontSize: 25,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 105.0),
              child: GiftyTextField(
                controller: viewModel.textController,
                hintText: '닉네임 입력',
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            Container(
              width: 340,
              height: 50,
              margin: const EdgeInsets.fromLTRB(25, 0, 25, 10),
              child: GiftyButton(
                buttonText: '저장',
                isEnabled: viewModel.isButtonEnabled,
                buttonTap: () async {
                  await viewModel.saveNickname();
                  
                  if (context.mounted) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}