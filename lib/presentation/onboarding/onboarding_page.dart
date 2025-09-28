
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Onboarding'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to Gifty!'),
            const SizedBox(height: 20),
            SvgPicture.asset(
              'assets/images/qwerimage.svg',
              width: 200,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
