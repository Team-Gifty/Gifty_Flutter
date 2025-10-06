import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gifty_flutter/data/realm/models.dart';
import 'package:image_picker/image_picker.dart';
import 'package:realm/realm.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class HomeViewModel with ChangeNotifier {
  final Realm realm;
  late final StreamSubscription<RealmResultsChanges<User>> _userSubscription;
  User? _user;

  String appDocumentsPath = '';

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  bool _giftJustSaved = false;
  bool get giftJustSaved => _giftJustSaved;
  String? get nickname => _user?.nickname;

  List<Gift> get gifts => _user?.gifts ?? [];

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

  bool get isRegistrationReady =>
      _image != null &&
      _isGiftNameEntered &&
      _isUsageEntered &&
      isExpiryDateSelected;

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

  Future<void> init() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    appDocumentsPath = appDocDir.path;
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

  void resetGiftJustSaved() {
    _giftJustSaved = false;
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

  Future<void> deleteGift(Gift gift) async {
    realm.write(() {
      realm.delete(gift);
    });
    notifyListeners();
  }

  Future<void> saveGift() async {
    if (!isRegistrationReady || _user == null) {
      return;
    }

    final imageName = path.basename(_image!.path);
    final savedImage = await _image!.copy('$appDocumentsPath/$imageName');

    final newGift = Gift(
      ObjectId(),
      giftNameController.text,
      usageController.text,
      _expiryDate!,
      imageName, // Save only the filename
      memo: memoController.text.isNotEmpty ? memoController.text : null,
    );

    realm.write(() {
      _user!.gifts.add(newGift);
    });

    _image = null;
    resetBottomSheetStep();
    _selectedIndex = 0;
    _giftJustSaved = true;
    notifyListeners();
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
