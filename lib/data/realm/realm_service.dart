import 'package:realm/realm.dart';
import 'models/user.dart';

class RealmService {
  static RealmService? _instance;
  late Realm _realm;

  RealmService._internal() {
    final config = Configuration.local([User.schema]);
    _realm = Realm(config);
  }

  static RealmService getInstance() {
    _instance ??= RealmService._internal();
    return _instance!;
  }

  Realm get realm => _realm;

  // User 관련 메서드
  void saveUser(String nickname) {
    final now = DateTime.now();
    _realm.write(() {
      // 기존 유저가 있으면 업데이트, 없으면 새로 생성
      final existingUser = _realm.all<User>().firstOrNull;
      
      if (existingUser != null) {
        existingUser.nickname = nickname;
        existingUser.updatedAt = now;
      } else {
        _realm.add(User(
          ObjectId(),
          nickname,
          now,
          now,
        ));
      }
    });
  }

  User? getUser() {
    return _realm.all<User>().firstOrNull;
  }

  String? getNickname() {
    return getUser()?.nickname;
  }

  void deleteUser() {
    _realm.write(() {
      _realm.deleteAll<User>();
    });
  }

  void close() {
    _realm.close();
  }
}
