# Gifty Flutter Colors

이 프로젝트에는 디자인 시스템에 맞는 색상 팔레트가 정의되어 있습니다.

## 색상 구조

### 색상 정의 위치
- `lib/core/theme/app_colors.dart` - 모든 색상 정의
- `lib/core/theme/app_theme.dart` - 테마 설정
- `lib/core/theme/app_text_styles.dart` - 텍스트 스타일 정의

### 정의된 색상들

| 색상명 | Hex Code | 용도 |
|--------|----------|------|
| sortText | #6A4C4C | 정렬 문구 |
| unselectedTab | #CDB9AD | 미선택 탭 |
| selectedTab | #6A4C4C | 선택 탭 |
| middleTalk | #7F7D7D | 미들톡 문구 |
| inputAfterButton | #A98E5C | 입력 후 버튼 문구 |
| inputBeforeButton | #DDC495 | 입력 전 버튼 문구 |
| inputAfterButtonBg | #FDE1AD | 입력 후 버튼 배경 |
| inputBeforeButtonBg | #FCEDD0 | 입력 전 버튼 배경 |
| nicknameInput | #D9D9D9 | 닉네임 입력 |
| inputBorder | #DBDBDB | 입력창 테두리 |
| inputField | #EAEAEA | 입력창 |
| background | #FFF7EC | 배경색 |

## 사용 방법

### 1. 색상 사용
```dart
import 'package:gifty_flutter/core/theme/theme.dart';

Container(
  color: AppColors.background,
  child: Text(
    'Hello World',
    style: TextStyle(color: AppColors.selectedTab),
  ),
)
```

### 2. 테마 적용
```dart
MaterialApp(
  theme: AppTheme.lightTheme,
  home: MyHomePage(),
)
```

### 3. 텍스트 스타일 사용
```dart
Text(
  '제목',
  style: AppTextStyles.h4,
)

Text(
  '본문',
  style: AppTextStyles.bodyMedium,
)
```

## 색상 팔레트 미리보기

앱을 실행하면 OnboardingPage에서 모든 색상을 확인할 수 있습니다.

```bash
flutter run
```
