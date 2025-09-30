import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gifty_flutter/core/theme/app_colors.dart';
import 'package:gifty_flutter/view_model/home_view_model.dart';
import 'package:gifty_flutter/view_model/nickname_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget _buildHomeWidget(BuildContext context) {
    final nicknameViewModel = Provider.of<NicknameViewModel>(context);
    final savedNickname = nicknameViewModel.getSavedNickname();
    
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            savedNickname != null ? '$savedNickname님, 환영합니다!' : '닉네임이 없습니다',
            style: const TextStyle(
              fontFamily: 'MemomentKkukkkuk',
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 20),
          if (savedNickname != null)
            ElevatedButton(
              onPressed: () {
                nicknameViewModel.deleteNickname();
              },
              child: const Text('닉네임 삭제'),
            ),
        ],
      ),
    );
  }

  Widget _buildPlusWidget() {
    return const Center(
      child: Text(
        'Index 1: Plus',
      ),
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
