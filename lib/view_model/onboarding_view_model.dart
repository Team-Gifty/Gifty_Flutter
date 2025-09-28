import 'package:flutter/material.dart';
import 'package:gifty_flutter/view/nickname/nickname_page.dart';

class OnboardingViewModel with ChangeNotifier {
  void navigateToNicknamePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NicknamePage()),
    );
  }
}
