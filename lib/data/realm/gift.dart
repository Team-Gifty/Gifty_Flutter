part of 'models.dart';

@RealmModel()
class _Gift {
  @PrimaryKey()
  late ObjectId id;

  late String name;
  late String usage;
  late DateTime expiryDate;
  late String? memo;
  late String imagePath;
}
