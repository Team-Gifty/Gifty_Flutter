import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gifty_flutter/data/realm/models/user.dart';
import 'package:image_picker/image_picker.dart';
import 'package:realm/realm.dart';

class HomeViewModel with ChangeNotifier {
  final Realm realm;
  late final StreamSubscription<RealmResultsChanges<User>> _userSubscription;
  User? _user;

  HomeViewModel(this.realm) {
    _user = realm.all<User>().firstOrNull;
    _userSubscription = realm.all<User>().changes.listen((changes) {
      _user = changes.results.firstOrNull;
      notifyListeners();
    });
  }

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;
  String? get nickname => _user?.nickname;

  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  File? _image;
  File? get image => _image;

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _userSubscription.cancel();
    super.dispose();
  }
}
