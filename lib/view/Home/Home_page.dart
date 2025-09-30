import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gifty_flutter/core/theme/app_colors.dart';
import 'package:gifty_flutter/view/widgets/gifty_text_field.dart';
import 'package:gifty_flutter/view_model/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:gifty_flutter/view/widgets/gifty_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget _buildHomeWidget(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);
    final nickname = viewModel.nickname;

    return Stack(
      children: [
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

  Widget _buildPlusWidget(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);
    return Stack(
      children: [
        Positioned(
          top: 119,
          left: 45,
          right: 45,
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
                  viewModel.pickImage();
                },
                child: Container(
                  height: 323,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7EAD8),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: viewModel.image == null
                      ? const Center(
                    child: Text(
                      '탭하여 교환권 넣기',
                      style: TextStyle(
                        fontFamily: 'OngeulipParkDahyeon',
                        fontSize: 23,
                        color: Color(0xFFBFA98A),
                      ),
                    ),
                  )
                      : ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.file(
                      viewModel.image!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              GiftyButton(
                buttonText: '정보 작성하기',
                backgroundColor: AppColors.inputAfterButtonBg,
                borderRadius: 12,
                isEnabled: viewModel.image != null,
                buttonTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: const Color(0xFFFFF7EC),
                    builder: (BuildContext _) {
                      return ChangeNotifierProvider.value(
                        value: viewModel,
                        child: _buildBottomSheetContent(context),
                      );
                    },
                  ).whenComplete(() {
                    viewModel.resetBottomSheetStep();
                  });
                },
              ),
              const SizedBox(height: 16),
              GiftyButton(
                buttonText: '등록',
                backgroundColor: AppColors.inputAfterButtonBg,
                borderRadius: 12,
                isEnabled: viewModel.image != null,
                buttonTap: () {
                  // TODO: Implement registration
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomSheetContent(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, viewModel, child) {
        String title;
        Widget mainContent;
        Widget button;

        switch (viewModel.bottomSheetStep) {
          case 0:
            title = '교환권 이름(상품명)을 알려주세요!';
            mainContent = GiftyTextField(
              hintText: '여기에 입력하세요',
              textAlign: TextAlign.center,
              controller: viewModel.giftNameController,
            );
            button = GiftyButton(
              buttonText: '확인',
              isEnabled: viewModel.isGiftNameEntered,
              buttonTap: viewModel.nextBottomSheetStep,
              height: 50,
            );
            break;
          case 1:
            title = '어디서 사용하나요?';
            mainContent = GiftyTextField(
              hintText: '여기에 입력하세요',
              textAlign: TextAlign.center,
              controller: viewModel.usageController,
            );
            button = GiftyButton(
              buttonText: '확인',
              isEnabled: viewModel.isUsageEntered,
              buttonTap: viewModel.nextBottomSheetStep,
              height: 50,
            );
            break;
          case 2:
            title = '언제까지 써야하나요?';
            mainContent = ElevatedButton(
              child: Text(viewModel.expiryDate == null
                  ? '날짜 선택'
                  : '${viewModel.expiryDate!.year}/${viewModel.expiryDate!.month}/${viewModel.expiryDate!.day}'),
              onPressed: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: viewModel.expiryDate ?? DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2101),
                );
                if (picked != null && picked != viewModel.expiryDate) {
                  viewModel.setExpiryDate(picked);
                }
              },
            );
            button = GiftyButton(
              buttonText: '확인',
              isEnabled: viewModel.isExpiryDateSelected,
              buttonTap: viewModel.nextBottomSheetStep,
              height: 50,
            );
            break;
          case 3:
            title = '필요시, 메모를 작성해주세요 :)';
            mainContent = GiftyTextField(
              hintText: '여기에 입력하세요',
              textAlign: TextAlign.center,
              controller: viewModel.memoController,
            );
            button = GiftyButton(
              buttonText: '완료',
              isEnabled: true,
              buttonTap: () {
                // TODO: Save all the data
                Navigator.pop(context);
              },
              height: 50,
            );
            break;
          default:
            title = '';
            mainContent = const SizedBox.shrink();
            button = const SizedBox.shrink();
        }

        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 45, right: 45),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 상단 타이틀 + 뒤로가기
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (viewModel.bottomSheetStep == 0) {
                          Navigator.pop(context);
                        } else {
                          viewModel.previousBottomSheetStep();
                        }
                      },
                      child: SvgPicture.asset(
                        'assets/images/backButton.svg',
                        width: 33,
                        height: 20.5,
                      ),
                    ),
                    const SizedBox(width: 41),
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontFamily: 'OngeulipParkDahyeon',
                          fontSize: 25,
                          color: Color(0xFF6A4C4C),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),

                // 제목과 mainContent 사이 간격 76
                const SizedBox(height: 76),

                // 메인 입력 위젯
                mainContent,

                const Spacer(),

                // 버튼 하단 고정
                Padding(
                  padding: const EdgeInsets.only(bottom: 33.0),
                  child: SizedBox(width: double.infinity, child: button),
                ),
              ],
            ),
          ),
        );
      },
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
          return _buildPlusWidget(context);
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
