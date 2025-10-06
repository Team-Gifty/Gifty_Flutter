import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gifty_flutter/core/theme/app_colors.dart';
import 'package:gifty_flutter/view/Home/add_gift_tab_view.dart';
import 'package:gifty_flutter/view/Home/home_tab_view.dart';
import 'package:gifty_flutter/view/Home/search_tab_view.dart';
import 'package:gifty_flutter/view_model/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:gifty_flutter/view/Home/widgets/success_toast.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = HomeViewModel(Provider.of(context, listen: false));
    _viewModel.init();
  }

  static const List<Widget> _widgetOptions = <Widget>[
    HomeTabView(),
    AddGiftTabView(),
    SearchTabView(),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.giftJustSaved) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showDialog(
                context: context,
                builder: (context) => const SuccessToast(),
              ).then((_) {
                // This is called when the dialog is dismissed.
              });
              Future.delayed(const Duration(seconds: 2), () {
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                }
              });
              viewModel.resetGiftJustSaved();
            });
          }

          if (viewModel.appDocumentsPath.isEmpty) {
            return const Scaffold(
              backgroundColor: AppColors.background,
              body: Center(child: CircularProgressIndicator()),
            );
          }
          return Scaffold(
            backgroundColor: AppColors.background,
            body: _widgetOptions.elementAt(viewModel.selectedIndex),
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
        },
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
