import 'package:gifty_flutter/view/detail/gift_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gifty_flutter/view/Home/widgets/gift_list_item.dart';
import 'package:gifty_flutter/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({super.key});

  @override
  Widget build(BuildContext context) {
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
                'assets/images/homeImage.svg',
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
        viewModel.gifts.isEmpty
            ? Center(
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
              )
            : Positioned(
                top: 64 + 36 + 16, // Header height + spacing
                left: 0,
                right: 0,
                bottom: 0,
                child: ListView.separated(
                  itemCount: viewModel.gifts.length,
                  itemBuilder: (context, index) {
                    final gift = viewModel.gifts[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (newContext) => ChangeNotifierProvider.value(
                              value: viewModel,
                              child: GiftDetailPage(
                                gift: gift,
                                documentsPath: viewModel.appDocumentsPath,
                              ),
                            ),
                          ),
                        );
                      },
                      child: GiftListItem(
                        gift: gift,
                        documentsPath: viewModel.appDocumentsPath,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                ),
              ),
      ],
    );
  }
}
