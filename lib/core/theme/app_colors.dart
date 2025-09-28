import 'package:flutter/material.dart';

/// 앱에서 사용하는 색상들을 정의한 클래스
class AppColors {
  AppColors._(); // private constructor to prevent instantiation

  // Primary Colors (기본 색상들)
  /// 정렬 문구 - 6A4C4C
  static const Color sortText = Color(0xFF6A4C4C);

  /// 미선택 탭 - CDB9AD  
  static const Color unselectedTab = Color(0xFFCDB9AD);

  /// 선택 탭 - 6A4C4C
  static const Color selectedTab = Color(0xFF6A4C4C);

  /// 미들톡 문구 - 7F7D7D
  static const Color middleTalk = Color(0xFF7F7D7D);

  /// 입력 후 버튼 문구 - A98E5C
  static const Color inputAfterButton = Color(0xFFA98E5C);

  /// 입력 전 버튼 문구 - DDC495
  static const Color inputBeforeButton = Color(0xFFDDC495);

  /// 입력 후 버튼 배경 - FDE1AD
  static const Color inputAfterButtonBg = Color(0xFFFDE1AD);

  /// 입력 전 버튼 배경 - FCEDD0
  static const Color inputBeforeButtonBg = Color(0xFFFCEDD0);

  /// 닉네임 입력 - D9D9D9
  static const Color nicknameInput = Color(0xFFD9D9D9);

  /// 입력창 테두리 - DBDBDB
  static const Color inputBorder = Color(0xFFDBDBDB);

  /// 입력창 - EAEAEA
  static const Color inputField = Color(0xFFEAEAEA);

  /// 배경색 - FFF7EC
  static const Color background = Color(0xFFFFF7EC);

  // Additional Colors
  /// 흰색
  static const Color white = Color(0xFFFFFFFF);
  
  /// 검정색
  static const Color black = Color(0xFF000000);
  
  /// 투명색
  static const Color transparent = Color(0x00000000);
  
  /// 그림자 색상
  static const Color shadow = Color(0x1A000000);
  
  // Status Colors
  /// 성공 색상
  static const Color success = Color(0xFF4CAF50);
  
  /// 경고 색상  
  static const Color warning = Color(0xFFFF9800);
  
  /// 오류 색상
  static const Color error = Color(0xFFF44336);
  
  /// 정보 색상
  static const Color info = Color(0xFF2196F3);

  // Hex Code 상수들 (참고용)
  static const String sortTextHex = '6A4C4C';
  static const String unselectedTabHex = 'CDB9AD';
  static const String selectedTabHex = '6A4C4C';
  static const String middleTalkHex = '7F7D7D';
  static const String inputAfterButtonHex = 'A98E5C';
  static const String inputBeforeButtonHex = 'DDC495';
  static const String inputAfterButtonBgHex = 'FDE1AD';
  static const String inputBeforeButtonBgHex = 'FCEDD0';
  static const String nicknameInputHex = 'D9D9D9';
  static const String inputBorderHex = 'DBDBDB';
  static const String inputFieldHex = 'EAEAEA';
  static const String backgroundHex = 'FFF7EC';
}
