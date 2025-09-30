// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
class User extends _User with RealmEntity, RealmObjectBase, RealmObject {
  User(ObjectId id, String nickname, DateTime createdAt, DateTime updatedAt) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'nickname', nickname);
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set(this, 'updatedAt', updatedAt);
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
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
