
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gifty_flutter/core/theme/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Center(
      child: Text(
        'Index 0: Home',
      ),
    ),
    Center(
      child: Text(
        'Index 1: Plus',
      ),
    ),
    Center(
      child: Text(
        'Index 2: Search',
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.background,
        elevation: 0,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildNavItem(0, 'assets/images/homeImage.svg'),
              const SizedBox(width: 90),
              _buildNavItem(1, 'assets/images/plusImage.svg'),
              const SizedBox(width: 90),
              _buildNavItem(2, 'assets/images/searchImage.svg'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String assetName) {
    return IconButton(
      icon: SvgPicture.asset(
        assetName,
        width: 25,
        height: 25,
        colorFilter: ColorFilter.mode(
          _selectedIndex == index
              ? AppColors.selectedTab
              : AppColors.unselectedTab,
          BlendMode.srcIn,
        ),
      ),
      onPressed: () => _onItemTapped(index),
    );
  }
}
