import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gifty_flutter/core/theme/theme.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Gifty Flutter',
          style: AppTextStyles.h5.copyWith(color: AppColors.selectedTab),
        ),
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 색상 팔레트 섹션
            Text(
              '색상 팔레트',
              style: AppTextStyles.h4,
            ),
            const SizedBox(height: 16),
            
            // 색상 그리드
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 3,
                children: [
                  _ColorCard('정렬 문구', AppColors.sortText),
                  _ColorCard('미선택 탭', AppColors.unselectedTab),
                  _ColorCard('선택 탭', AppColors.selectedTab),
                  _ColorCard('미들톡 문구', AppColors.middleTalk),
                  _ColorCard('입력 후 버튼', AppColors.inputAfterButton),
                  _ColorCard('입력 전 버튼', AppColors.inputBeforeButton),
                  _ColorCard('입력 후 버튼 배경', AppColors.inputAfterButtonBg),
                  _ColorCard('입력 전 버튼 배경', AppColors.inputBeforeButtonBg),
                  _ColorCard('닉네임 입력', AppColors.nicknameInput),
                  _ColorCard('입력창 테두리', AppColors.inputBorder),
                  _ColorCard('입력창', AppColors.inputField),
                  _ColorCard('배경색', AppColors.background),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // 버튼 예시
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      '입력 후 버튼',
                      style: AppTextStyles.inputAfterButton,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      '입력 전 버튼',
                      style: AppTextStyles.inputBeforeButton,
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // 입력 필드 예시
            TextField(
              decoration: InputDecoration(
                hintText: '닉네임을 입력하세요',
                hintStyle: AppTextStyles.middleTalk,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ColorCard extends StatelessWidget {
  final String name;
  final Color color;
  
  const _ColorCard(this.name, this.color);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              name,
              style: AppTextStyles.labelSmall.copyWith(
                color: _getContrastColor(color),
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 2),
            Text(
              '#${color.value.toRadixString(16).substring(2).toUpperCase()}',
              style: AppTextStyles.labelSmall.copyWith(
                color: _getContrastColor(color).withOpacity(0.8),
                fontSize: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Color _getContrastColor(Color color) {
    // 색상의 밝기에 따라 텍스트 색상을 결정
    double luminance = color.computeLuminance();
    return luminance > 0.5 ? AppColors.black : AppColors.white;
  }
}
