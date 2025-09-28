import 'package:flutter/material.dart';
import 'app_colors.dart';

/// 앱에서 사용하는 텍스트 스타일을 정의한 클래스
class AppTextStyles {
  AppTextStyles._(); // private constructor

  // 헤딩 스타일들
  /// 큰 제목 (H1)
  static const TextStyle h1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
    height: 1.2,
  );

  /// 중간 제목 (H2)
  static const TextStyle h2 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
    height: 1.2,
  );

  /// 작은 제목 (H3)
  static const TextStyle h3 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
    height: 1.2,
  );

  /// 섹션 제목 (H4)
  static const TextStyle h4 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
    height: 1.3,
  );

  /// 소제목 (H5)
  static const TextStyle h5 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
    height: 1.3,
  );

  /// 작은 소제목 (H6)
  static const TextStyle h6 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
    height: 1.4,
  );

  // 본문 스타일들
  /// 큰 본문
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.black,
    height: 1.5,
  );

  /// 기본 본문
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.black,
    height: 1.5,
  );

  /// 작은 본문
  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.black,
    height: 1.5,
  );

  // 라벨 스타일들
  /// 큰 라벨
  static const TextStyle labelLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
    height: 1.4,
  );

  /// 기본 라벨
  static const TextStyle labelMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
    height: 1.4,
  );

  /// 작은 라벨
  static const TextStyle labelSmall = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
    height: 1.4,
  );

  // 버튼 스타일들
  /// 큰 버튼 텍스트
  static const TextStyle buttonLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.2,
  );

  /// 기본 버튼 텍스트
  static const TextStyle buttonMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.2,
  );

  /// 작은 버튼 텍스트
  static const TextStyle buttonSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 1.2,
  );

  // 특별한 용도의 스타일들
  /// 캡션 (설명 텍스트)
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.middleTalk,
    height: 1.3,
  );

  /// 오버라인 (작은 상단 텍스트)
  static const TextStyle overline = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColors.middleTalk,
    height: 1.6,
    letterSpacing: 1.5,
  );

  // 앱 특정 스타일들
  /// 정렬 문구용 스타일
  static const TextStyle sortText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.sortText,
    height: 1.4,
  );

  /// 미선택 탭용 스타일
  static const TextStyle unselectedTab = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.unselectedTab,
    height: 1.4,
  );

  /// 선택된 탭용 스타일
  static const TextStyle selectedTab = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.selectedTab,
    height: 1.4,
  );

  /// 미들톡 문구용 스타일
  static const TextStyle middleTalk = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.middleTalk,
    height: 1.5,
  );

  /// 입력 후 버튼 텍스트 스타일
  static const TextStyle inputAfterButton = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.inputAfterButton,
    height: 1.2,
  );

  /// 입력 전 버튼 텍스트 스타일
  static const TextStyle inputBeforeButton = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.inputBeforeButton,
    height: 1.2,
  );
}
