# Realm 통합 완료!

## 🎉 설정된 기능

### 1. Realm 패키지 추가
- `realm: ^20.0.0` (데이터베이스)
- `realm_generator: ^20.0.0` (코드 생성기)
- `build_runner: ^2.4.13` (빌드 도구)

### 2. 생성된 파일들
```
lib/data/realm/
├── models/
│   └── user.dart          # User 모델 정의
└── realm_service.dart     # Realm 데이터베이스 관리 서비스
```

### 3. 업데이트된 파일들
- `lib/view_model/nickname_view_model.dart` - Realm 연동 추가
- `lib/view/nickName/nickName_page.dart` - 저장 버튼 기능 연결
- `lib/view/Home/Home_page.dart` - 저장된 닉네임 표시 기능 추가

## 🚀 사용 방법

### 1단계: 코드 생성
터미널에서 다음 명령어를 실행하세요:
```bash
dart run build_runner build
```

이 명령어가 `user.realm.dart` 파일을 자동으로 생성합니다.

### 2단계: 앱 실행
```bash
flutter run
```

### 3단계: 테스트
1. 온보딩 화면에서 닉네임 입력 페이지로 이동
2. 닉네임 입력 후 "저장" 버튼 클릭
3. 홈 화면에서 "OOO님, 환영합니다!" 메시지 확인
4. 앱을 종료했다가 다시 실행해도 닉네임이 유지됨을 확인

## 📱 기능 설명

### NicknameViewModel에 추가된 메서드

```dart
// 닉네임 저장
viewModel.saveNickname();

// 저장된 닉네임 가져오기
String? nickname = viewModel.getSavedNickname();

// 닉네임 삭제
viewModel.deleteNickname();
```

### RealmService 메서드

```dart
final realmService = RealmService.getInstance();

// 닉네임 저장/업데이트
realmService.saveUser("닉네임");

// 유저 정보 가져오기
User? user = realmService.getUser();

// 닉네임만 가져오기
String? nickname = realmService.getNickname();

// 유저 삭제
realmService.deleteUser();
```

## 🔧 문제 해결

### "user.realm.dart를 찾을 수 없습니다" 에러가 발생하면:
```bash
flutter clean
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

### 모델을 수정했을 때:
```bash
dart run build_runner build --delete-conflicting-outputs
```

## 💡 추가 개선 아이디어

1. **앱 시작 시 닉네임 체크**
   - 닉네임이 있으면 홈으로 바로 이동
   - 닉네임이 없으면 닉네임 입력 페이지로 이동

2. **닉네임 수정 기능**
   - 설정 페이지에서 닉네임 수정 가능하게

3. **다른 데이터도 저장**
   - 선호하는 선물 카테고리
   - 친구 목록
   - 선물 히스토리 등

## 📚 더 알아보기

- [Realm 공식 문서](https://www.mongodb.com/docs/realm/sdk/flutter/)
- `REALM_GUIDE.md` 파일 참조
