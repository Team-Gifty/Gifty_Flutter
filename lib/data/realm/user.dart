part of 'models.dart';

@RealmModel()
class _User {
  @PrimaryKey()
  late ObjectId id;

  late String nickname;

  late DateTime createdAt;

  late DateTime updatedAt;

  late List<_Gift> gifts;
}
