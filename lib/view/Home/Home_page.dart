import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gifty_flutter/core/theme/app_colors.dart';
import 'package:gifty_flutter/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget _buildHomeWidget(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);
    final nickname = viewModel.nickname;

    return Stack(
      children: [
        /// 닉네임 영역 (좌측 상단)
        Positioned(
          top: 64,
          left: 34,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/image_8-removebg-preview 1',
                width: 30,
                height: 36,
              ),
              const SizedBox(width: 8),
              Text(
                nickname != null ? '$nickname님의 교환권' : '닉네임을 불러올 수 없습니다.',
                style: const TextStyle(
                  fontFamily: 'GumiRomance',
                  fontSize: 15,
                  color: Color(0xFF6A4C4C),
                ),
              ),
            ],
          ),
        ),

        Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/bigBox.svg',
                width: 124.11,
                height: 113,
              ),
              const Text(
                '아직 등록된 교환권이 없어요',
                style: TextStyle(
                  fontFamily: 'OngeulipParkDahyeon',
                  fontSize: 28,
                  color: Color(0xFF7F7D7D),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPlusWidget() {
    return Stack(
      children: [
        Positioned(
          top: 119,
          left: 52,
          right: 52,
          child: Column(
            children: [
              const Text(
                '등록할 교환권 이미지를 넣어주세요 :)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'OngeulipParkDahyeon',
                  fontSize: 25,
                  color: Color(0xFF6A4C4C),
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  // TODO: Implement image picking logic
                },
                child: Container(
                  height: 323,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7EAD8),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Text(
                      '탭하여 교환권 넣기',
                      style: TextStyle(
                        fontFamily: 'OngeulipParkDahyeon',
                        fontSize: 23,
                        color: Color(0xFFBFA98A),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSearchWidget() {
    return const Center(
      child: Text(
        'Index 2: Search',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);

    Widget getBodyWidget() {
      switch (viewModel.selectedIndex) {
        case 0:
          return _buildHomeWidget(context);
        case 1:
          return _buildPlusWidget();
        case 2:
          return _buildSearchWidget();
        default:
          return _buildHomeWidget(context);
      }
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: getBodyWidget(),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.background,
        elevation: 0,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildNavItem(viewModel, 0, 'assets/images/homeImage.svg'),
              const SizedBox(width: 90),
              _buildNavItem(viewModel, 1, 'assets/images/plusImage.svg'),
              const SizedBox(width: 90),
              _buildNavItem(viewModel, 2, 'assets/images/searchImage.svg'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(HomeViewModel viewModel, int index, String assetName) {
    return IconButton(
      icon: SvgPicture.asset(
        assetName,
        width: 25,
        height: 25,
        colorFilter: ColorFilter.mode(
          viewModel.selectedIndex == index
              ? AppColors.selectedTab
              : AppColors.unselectedTab,
          BlendMode.srcIn,
        ),
      ),
      onPressed: () => viewModel.onItemTapped(index),
    );
  }
}
