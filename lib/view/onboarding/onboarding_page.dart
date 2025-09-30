import 'package:flutter/material.dart';
import 'package:gifty_flutter/core/theme/app_colors.dart';
import 'package:gifty_flutter/data/realm/models.dart';
import 'package:gifty_flutter/view/Home/Home_page.dart';
import 'package:gifty_flutter/view/nickname/nickname_page.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkUserAndNavigate();
    });
  }

  void _checkUserAndNavigate() {
    final realm = Provider.of<Realm>(context, listen: false);
    final user = realm.all<User>().firstOrNull;

    if (user != null) {
      // User exists, navigate to Home
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      // No user, navigate to Nickname
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NicknamePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Show a loading indicator while checking user status
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}