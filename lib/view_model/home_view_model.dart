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

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  String? get nickname => _user?.nickname;

  File? _image;
  File? get image => _image;

  int _bottomSheetStep = 0;
  int get bottomSheetStep => _bottomSheetStep;

  final TextEditingController giftNameController = TextEditingController();
  final TextEditingController usageController = TextEditingController();
  final TextEditingController memoController = TextEditingController();
  bool _isGiftNameEntered = false;
  bool get isGiftNameEntered => _isGiftNameEntered;
  bool _isUsageEntered = false;
  bool get isUsageEntered => _isUsageEntered;

  DateTime? _expiryDate;
  DateTime? get expiryDate => _expiryDate;
  bool get isExpiryDateSelected => _expiryDate != null;

  HomeViewModel(this.realm) {
    _user = realm.all<User>().firstOrNull;
    _userSubscription = realm.all<User>().changes.listen((changes) {
      _user = changes.results.firstOrNull;
      notifyListeners();
    });
    giftNameController.addListener(_onGiftNameChanged);
    usageController.addListener(_onUsageChanged);
    memoController.addListener(_onMemoChanged);
  }

  void _onGiftNameChanged() {
    if (giftNameController.text.isNotEmpty != _isGiftNameEntered) {
      _isGiftNameEntered = giftNameController.text.isNotEmpty;
      notifyListeners();
    }
  }

  void _onUsageChanged() {
    if (usageController.text.isNotEmpty != _isUsageEntered) {
      _isUsageEntered = usageController.text.isNotEmpty;
      notifyListeners();
    }
  }

  void setExpiryDate(DateTime date) {
    _expiryDate = date;
    notifyListeners();
  }

  void _onMemoChanged() {
    // For now, just notify listeners. We can add logic here if needed.
    notifyListeners();
  }

  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      notifyListeners();
    }
  }

  void nextBottomSheetStep() {
    _bottomSheetStep++;
    notifyListeners();
  }

  void resetBottomSheetStep() {
    _bottomSheetStep = 0;
    giftNameController.clear();
    usageController.clear();
    _expiryDate = null;
    memoController.clear();
  }

  void previousBottomSheetStep() {
    if (_bottomSheetStep > 0) {
      _bottomSheetStep--;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _userSubscription.cancel();
    giftNameController.removeListener(_onGiftNameChanged);
    giftNameController.dispose();
    usageController.removeListener(_onUsageChanged);
    usageController.dispose();
    memoController.removeListener(_onMemoChanged);
    memoController.dispose();
    super.dispose();
  }
}
