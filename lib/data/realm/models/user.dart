import 'package:realm/realm.dart';

part 'user.realm.dart';

@RealmModel()
class _User {
  @PrimaryKey()
  late ObjectId id;

  late String nickname;

  late DateTime createdAt;

  late DateTime updatedAt;
}
