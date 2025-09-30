import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gifty_flutter/core/theme/theme.dart';
import 'package:gifty_flutter/view/widgets/gifty_button.dart';
import 'package:gifty_flutter/view_model/onboarding_view_model.dart';
import 'package:provider/provider.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<OnboardingViewModel>(context, listen: false);

    return Scaffold(
      backgroundColor: AppColors.background,
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
            bottom: 39,
            left: 24,
            right: 24,
            child: GiftyButton(
              buttonText: 'Gifty 사용하러 가기',
              buttonTap: () {
                viewModel.navigateToNicknamePage(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}