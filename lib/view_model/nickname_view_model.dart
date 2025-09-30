import 'package:flutter/material.dart';
import 'package:gifty_flutter/data/realm/realm_service.dart';

class NicknameViewModel with ChangeNotifier {
  final TextEditingController _textController = TextEditingController();
  final RealmService _realmService = RealmService.getInstance();
  bool _isButtonEnabled = false;

  NicknameViewModel() {
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

  // 닉네임 저장
  void saveNickname() {
    if (_textController.text.isNotEmpty) {
      _realmService.saveUser(_textController.text);
      notifyListeners();
    }
  }

  // 저장된 닉네임 가져오기
  String? getSavedNickname() {
    return _realmService.getNickname();
  }

  // 닉네임 삭제
  void deleteNickname() {
    _realmService.deleteUser();
    _textController.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
