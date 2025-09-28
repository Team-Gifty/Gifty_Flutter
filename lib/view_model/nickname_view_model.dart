import 'package:flutter/material.dart';

class NicknameViewModel with ChangeNotifier {
  final TextEditingController _textController = TextEditingController();
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

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
