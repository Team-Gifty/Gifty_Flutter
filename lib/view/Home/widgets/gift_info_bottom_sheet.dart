import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:gifty_flutter/view/widgets/gifty_button.dart';
import 'package:gifty_flutter/view/widgets/gifty_text_field.dart';
import 'package:gifty_flutter/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class GiftInfoBottomSheet extends StatelessWidget {
  const GiftInfoBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
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
            mainContent = Column(
              children: [
                GestureDetector(
                  onTap: () async {
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
                  child: Container(
                    height: 108,
                    margin: const EdgeInsets.symmetric(horizontal: 54),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF7EAD8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 14.0),
                          child: SvgPicture.asset(
                            'assets/images/calender.svg',
                            width: 45,
                            height: 45,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 45),
                          child: Text(
                            '클릭하여 날짜 선택',
                            style: TextStyle(
                              fontFamily: 'OngeulipParkDahyeon',
                              fontSize: 22,
                              color: Color(0xFF6A4C4C),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (viewModel.isExpiryDateSelected)
                  Padding(
                    padding: const EdgeInsets.only(top: 9),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 107.5),
                      child: Text(
                        '${viewModel.expiryDate!.year}.${viewModel.expiryDate!.month.toString().padLeft(2, '0')}.${viewModel.expiryDate!.day.toString().padLeft(2, '0')}',
                        style: const TextStyle(
                          fontFamily: 'OngeulipParkDahyeon',
                          fontSize: 23,
                          color: Color(0xFF6A4C4C),
                        ),
                      ),
                    ),
                  ),
              ],
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

        return Padding(
          padding: const EdgeInsets.only(top: 40, left: 30, right: 45),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                    const SizedBox(width: 32),
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
                const SizedBox(height: 60),
                mainContent,
                Padding(
                  padding: const EdgeInsets.only(top: 150.0, bottom: 33.0),
                  child: SizedBox(width: double.infinity, child: button),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
