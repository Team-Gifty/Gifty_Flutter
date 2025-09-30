import 'package:flutter/material.dart';
import 'package:gifty_flutter/view/onboarding/onboarding_page.dart';
import 'package:gifty_flutter/core/theme/theme.dart';
import 'package:gifty_flutter/view_model/home_view_model.dart';
import 'package:gifty_flutter/view_model/nickname_view_model.dart';
import 'package:gifty_flutter/view_model/onboarding_view_model.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart';
import 'package:gifty_flutter/data/realm/models/user.dart';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentsDirectory = await getApplicationDocumentsDirectory();
  final realmPath = path.join(appDocumentsDirectory.path, 'gifty.realm');

  // Realm 초기화
  final config = Configuration.local(
    [User.schema],
    path: realmPath,
  );
  final realm = Realm(config);
  
  // Realm 파일 경로 출력 (Realm Studio에서 열기 위해)
  print('==============================================');
  print('Realm Database Path: ${realm.config.path}');
  print('==============================================');
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => NicknameViewModel()),
        ChangeNotifierProvider(create: (_) => OnboardingViewModel()),
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
