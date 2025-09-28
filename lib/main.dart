import 'package:flutter/material.dart';
import 'package:gifty_flutter/presentation/onboarding/onboarding_page.dart';
import 'package:gifty_flutter/core/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Gifty Flutter',
      theme: AppTheme.lightTheme,
      home: OnboardingPage(),
    );
  }
}