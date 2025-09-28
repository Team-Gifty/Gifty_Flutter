import 'package:flutter/material.dart';
import 'app_colors.dart';

/// 색상 관련 유틸리티 함수들
class ColorUtils {
  ColorUtils._();

  /// Hex 문자열을 Color 객체로 변환
  static Color hexToColor(String hex) {
    // # 제거
    hex = hex.replaceAll('#', '');
    // 6자리가 아닌 경우 앞에 0 추가
    if (hex.length == 6) {
      hex = 'FF$hex';
    }
    return Color(int.parse(hex, radix: 16));
  }

  /// Color 객체를 Hex 문자열로 변환
  static String colorToHex(Color color) {
    return '#${color.value.toRadixString(16).substring(2).toUpperCase()}';
  }

  /// 색상의 밝기에 따라 대비되는 텍스트 색상 반환
  static Color getContrastColor(Color color) {
    double luminance = color.computeLuminance();
    return luminance > 0.5 ? AppColors.black : AppColors.white;
  }

  /// 색상을 더 밝게 만들기
  static Color lighten(Color color, [double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
    return hslLight.toColor();
  }

  /// 색상을 더 어둡게 만들기
  static Color darken(Color color, [double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }

  /// 색상의 투명도 변경
  static Color withAlpha(Color color, double alpha) {
    assert(alpha >= 0 && alpha <= 1);
    return color.withOpacity(alpha);
  }

  /// 두 색상 사이의 중간 색상 계산
  static Color lerpColor(Color a, Color b, double t) {
    return Color.lerp(a, b, t) ?? a;
  }

  /// 색상이 어두운 색상인지 확인
  static bool isDark(Color color) {
    return color.computeLuminance() < 0.5;
  }

  /// 색상이 밝은 색상인지 확인
  static bool isLight(Color color) {
    return color.computeLuminance() >= 0.5;
  }
}

/// 미리 정의된 색상 조합들
class ColorCombinations {
  ColorCombinations._();

  /// 기본 버튼 색상 조합
  static const Map<String, Color> primaryButton = {
    'background': AppColors.inputAfterButtonBg,
    'text': AppColors.inputAfterButton,
    'border': AppColors.inputAfterButton,
  };

  /// 보조 버튼 색상 조합
  static const Map<String, Color> secondaryButton = {
    'background': AppColors.inputBeforeButtonBg,
    'text': AppColors.inputBeforeButton,
    'border': AppColors.inputBorder,
  };

  /// 입력 필드 색상 조합
  static const Map<String, Color> inputField = {
    'background': AppColors.inputField,
    'text': AppColors.black,
    'border': AppColors.inputBorder,
    'hint': AppColors.middleTalk,
  };

  /// 탭 색상 조합
  static const Map<String, Color> tabs = {
    'selected': AppColors.selectedTab,
    'unselected': AppColors.unselectedTab,
    'background': AppColors.background,
  };
}
