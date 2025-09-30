import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:gifty_flutter/data/realm/models.dart';

class NicknameViewModel with ChangeNotifier {
  final Realm realm;
  final TextEditingController _textController = TextEditingController();
  bool _isButtonEnabled = false;

  NicknameViewModel(this.realm) {
    _textController.addListener(() {
      isButtonEnabled = _textController.text.isNotEmpty;
    });
  }

  TextEditingController get textController => _textController;

  bool get isButtonEnabled => _isButtonEnabled;

  set isButtonEnabled(bool value) {
    if (_isButtonEnabled != value) {
      _isButtonEnabled = value;
      notifyListeners();
    }
  }

  Future<void> saveNickname() async {
    if (_textController.text.isNotEmpty) {
      final nickname = _textController.text;
      await realm.write(() {
        final now = DateTime.now();
        final existingUser = realm.all<User>().firstOrNull;
        if (existingUser != null) {
          existingUser.nickname = nickname;
          existingUser.updatedAt = now;
        } else {
          realm.add(User(ObjectId(), nickname, now, now));
        }
      });
    }
  }

  String? getSavedNickname() {
    return realm.all<User>().firstOrNull?.nickname;
  }

  void deleteNickname() {
    realm.write(() {
      realm.deleteAll<User>();
    });
    _textController.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
