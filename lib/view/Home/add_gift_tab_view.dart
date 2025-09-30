import 'package:flutter/material.dart';

import 'package:gifty_flutter/core/theme/app_colors.dart';
import 'package:gifty_flutter/view/Home/widgets/gift_info_bottom_sheet.dart';
import 'package:gifty_flutter/view/widgets/gifty_button.dart';
import 'package:gifty_flutter/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class AddGiftTabView extends StatelessWidget {
  const AddGiftTabView({super.key});

  @override
  Widget build(BuildContext context) {
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
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFCBBDB1),
                        offset: const Offset(0, 4),
                        blurRadius: 4,
                        spreadRadius: 0,
                      ),
                    ],
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
                        child: const GiftInfoBottomSheet(),
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 16),
              GiftyButton(
                buttonText: '등록',
                backgroundColor: AppColors.inputAfterButtonBg,
                borderRadius: 12,
                isEnabled: viewModel.isRegistrationReady,
                buttonTap: viewModel.saveGift,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
