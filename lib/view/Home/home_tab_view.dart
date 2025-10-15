import 'package:gifty_flutter/view/detail/gift_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gifty_flutter/view/Home/widgets/gift_list_item.dart';
import 'package:gifty_flutter/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeTabView extends StatefulWidget {
  const HomeTabView({super.key});

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  bool _showSortOptions = false;

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
                'assets/images/BigLogo.svg',
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
        Positioned(
          top: 100,
          right: 33,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _showSortOptions = !_showSortOptions;
                  });
                },
                child: Row(
                  children: [
                    Text(
                      viewModel.sortOrder == SortOrder.expiryDate ? '짧은 유효기간 순' : '최근 등록 순',
                      style: const TextStyle(
                        fontFamily: 'OngeulipParkDahyeon',
                        fontSize: 16,
                        color: Color(0xFF6A4C4C),
                      ),
                    ),
                    const SizedBox(width: 7),
                    const Icon(Icons.arrow_drop_down, color: Color(0xFF6A4C4C), size: 24),
                  ],
                ),
              ),
              if (_showSortOptions)
                _buildSortOptionsContainer(context, viewModel),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSortOptionsContainer(BuildContext context, HomeViewModel viewModel) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFFDFBF6),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFEFE4D3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSortOption(context, viewModel, '짧은 유효기간 순', SortOrder.expiryDate),
          const SizedBox(height: 4),
          _buildSortOption(context, viewModel, '최근 등록 순', SortOrder.registrationDate),
        ],
      ),
    );
  }

  Widget _buildSortOption(BuildContext context, HomeViewModel viewModel, String text, SortOrder order) {
    final isSelected = viewModel.sortOrder == order;
    return GestureDetector(
      onTap: () {
        viewModel.setSortOrder(order);
        setState(() {
          _showSortOptions = false;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        color: Colors.transparent, // Tappable area
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'OngeulipParkDahyeon',
            fontSize: 16,
            color: isSelected ? const Color(0xFF6A4C4C) : const Color(0xFFBDBDBD),
          ),
        ),
      ),
    );
  }
}
