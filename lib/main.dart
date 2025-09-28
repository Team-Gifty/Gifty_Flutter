import 'package:flutter/material.dart';
import 'package:gifty_flutter/view/onboarding/onboarding_page.dart';
import 'package:gifty_flutter/core/theme/theme.dart';
import 'package:gifty_flutter/view_model/home_view_model.dart';
import 'package:gifty_flutter/view_model/nickname_view_model.dart';
import 'package:gifty_flutter/view_model/onboarding_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => NicknameViewModel()),
        ChangeNotifierProvider(create: (_) => OnboardingViewModel()),
      ],
      child: const MyApp(),
    ),
  );
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