import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gifty_flutter/core/theme/theme.dart';
import 'package:gifty_flutter/presentation/widgets/gifty_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Gifty Flutter',
          style: AppTextStyles.h5.copyWith(color: AppColors.selectedTab),
        ),
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: 138,
            top: 221,
            child: SvgPicture.asset(
              'assets/images/qwerimage.svg',
              width: 113,
              height: 176,
            ),
          ),
          Positioned(
            top: 411,
            left: 0,
            right: 0,
            child: Text(
              '소중한 선물, 놓치지 않도록\nGifty가 도와드려요',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'MemomentKkukkkuk',
                fontSize: 30,
                color: AppColors.selectedTab,
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            left: 24,
            right: 24,
            child: GiftyButton(
              buttonText: '활성화 버튼',
              buttonTap: () {},
            ),
          ),
          Positioned(
            bottom: 40,
            left: 24,
            right: 24,
            child: GiftyButton(
              buttonText: '비활성화 버튼',
              isEnabled: false,
              buttonTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}