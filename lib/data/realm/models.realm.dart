// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
class User extends _User with RealmEntity, RealmObjectBase, RealmObject {
  User(
    ObjectId id,
    String nickname,
    DateTime createdAt,
    DateTime updatedAt, {
    Iterable<Gift> gifts = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'nickname', nickname);
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set(this, 'updatedAt', updatedAt);
    RealmObjectBase.set<RealmList<Gift>>(this, 'gifts', RealmList<Gift>(gifts));
  }

  User._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get nickname =>
      RealmObjectBase.get<String>(this, 'nickname') as String;
  @override
  set nickname(String value) => RealmObjectBase.set(this, 'nickname', value);

  @override
  DateTime get createdAt =>
      RealmObjectBase.get<DateTime>(this, 'createdAt') as DateTime;
  @override
  set createdAt(DateTime value) =>
      RealmObjectBase.set(this, 'createdAt', value);

  @override
  DateTime get updatedAt =>
      RealmObjectBase.get<DateTime>(this, 'updatedAt') as DateTime;
  @override
  set updatedAt(DateTime value) =>
      RealmObjectBase.set(this, 'updatedAt', value);

  @override
  RealmList<Gift> get gifts =>
      RealmObjectBase.get<Gift>(this, 'gifts') as RealmList<Gift>;
  @override
  set gifts(covariant RealmList<Gift> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<User>> get changes =>
      RealmObjectBase.getChanges<User>(this);

  @override
  Stream<RealmObjectChanges<User>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<User>(this, keyPaths);

  @override
  User freeze() => RealmObjectBase.freezeObject<User>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'nickname': nickname.toEJson(),
      'createdAt': createdAt.toEJson(),
      'updatedAt': updatedAt.toEJson(),
      'gifts': gifts.toEJson(),
    };
  }

  static EJsonValue _toEJson(User value) => value.toEJson();
  static User _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'nickname': EJsonValue nickname,
        'createdAt': EJsonValue createdAt,
        'updatedAt': EJsonValue updatedAt,
      } =>
        User(
          fromEJson(id),
          fromEJson(nickname),
          fromEJson(createdAt),
          fromEJson(updatedAt),
          gifts: fromEJson(ejson['gifts']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(User._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(ObjectType.realmObject, User, 'User', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('nickname', RealmPropertyType.string),
      SchemaProperty('createdAt', RealmPropertyType.timestamp),
      SchemaProperty('updatedAt', RealmPropertyType.timestamp),
      SchemaProperty(
        'gifts',
        RealmPropertyType.object,
        linkTarget: 'Gift',
        collectionType: RealmCollectionType.list,
      ),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class Gift extends _Gift with RealmEntity, RealmObjectBase, RealmObject {
  Gift(
    ObjectId id,
    String name,
    String usage,
    DateTime expiryDate,
    String imagePath, {
    String? memo,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'usage', usage);
    RealmObjectBase.set(this, 'expiryDate', expiryDate);
    RealmObjectBase.set(this, 'memo', memo);
    RealmObjectBase.set(this, 'imagePath', imagePath);
  }

  Gift._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String get usage => RealmObjectBase.get<String>(this, 'usage') as String;
  @override
  set usage(String value) => RealmObjectBase.set(this, 'usage', value);

  @override
  DateTime get expiryDate =>
      RealmObjectBase.get<DateTime>(this, 'expiryDate') as DateTime;
  @override
  set expiryDate(DateTime value) =>
      RealmObjectBase.set(this, 'expiryDate', value);

  @override
  String? get memo => RealmObjectBase.get<String>(this, 'memo') as String?;
  @override
  set memo(String? value) => RealmObjectBase.set(this, 'memo', value);

  @override
  String get imagePath =>
      RealmObjectBase.get<String>(this, 'imagePath') as String;
  @override
  set imagePath(String value) => RealmObjectBase.set(this, 'imagePath', value);

  @override
  Stream<RealmObjectChanges<Gift>> get changes =>
      RealmObjectBase.getChanges<Gift>(this);

  @override
  Stream<RealmObjectChanges<Gift>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<Gift>(this, keyPaths);

  @override
  Gift freeze() => RealmObjectBase.freezeObject<Gift>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'name': name.toEJson(),
      'usage': usage.toEJson(),
      'expiryDate': expiryDate.toEJson(),
      'memo': memo.toEJson(),
      'imagePath': imagePath.toEJson(),
    };
  }

  static EJsonValue _toEJson(Gift value) => value.toEJson();
  static Gift _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'name': EJsonValue name,
        'usage': EJsonValue usage,
        'expiryDate': EJsonValue expiryDate,
        'imagePath': EJsonValue imagePath,
      } =>
        Gift(
          fromEJson(id),
          fromEJson(name),
          fromEJson(usage),
          fromEJson(expiryDate),
          fromEJson(imagePath),
          memo: fromEJson(ejson['memo']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Gift._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(ObjectType.realmObject, Gift, 'Gift', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('usage', RealmPropertyType.string),
      SchemaProperty('expiryDate', RealmPropertyType.timestamp),
      SchemaProperty('memo', RealmPropertyType.string, optional: true),
      SchemaProperty('imagePath', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
