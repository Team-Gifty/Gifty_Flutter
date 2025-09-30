

import 'package:flutter/material.dart';
import 'package:gifty_flutter/view/onboarding/onboarding_page.dart';
import 'package:gifty_flutter/core/theme/theme.dart';
import 'package:gifty_flutter/view_model/home_view_model.dart';
import 'package:gifty_flutter/view_model/nickname_view_model.dart';

import 'package:provider/provider.dart';
import 'package:realm/realm.dart';
import 'package:gifty_flutter/data/realm/models.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final config = Configuration.local([User.schema, Gift.schema], shouldDeleteIfMigrationNeeded: true);
  final realm = Realm(config);
  
  print('==============================================');
  print('Realm Database Path: ${realm.config.path}');
  print('==============================================');
  
  runApp(
    MultiProvider(
      providers: [
        Provider<Realm>.value(value: realm),
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
