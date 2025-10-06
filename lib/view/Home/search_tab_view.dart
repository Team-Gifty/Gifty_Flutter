import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gifty_flutter/data/realm/models.dart';
import 'package:gifty_flutter/view/Home/widgets/gift_list_item.dart';
import 'package:gifty_flutter/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class SearchTabView extends StatefulWidget {
  const SearchTabView({super.key});

  @override
  State<SearchTabView> createState() => _SearchTabViewState();
}

enum SearchFilter { productName, usage }

class _SearchTabViewState extends State<SearchTabView> {
  final TextEditingController _searchController = TextEditingController();
  List<Gift> _filteredGifts = [];
  bool _showFilterButtons = false;
  SearchFilter _searchFilter = SearchFilter.productName;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final viewModel = Provider.of<HomeViewModel>(context, listen: false);
    final allGifts = viewModel.gifts;
    final searchText = _searchController.text.toLowerCase();

    setState(() {
      if (searchText.isEmpty) {
        _filteredGifts = [];
      } else {
        _filteredGifts = allGifts.where((gift) {
          if (_searchFilter == SearchFilter.productName) {
            return gift.name.toLowerCase().contains(searchText);
          } else {
            return gift.usage.toLowerCase().contains(searchText);
          }
        }).toList();
      }
    });
  }

  Widget _buildFilterButtons() {
    return Container(
      width: 94,
      height: 54,
      decoration: BoxDecoration(
        color: const Color(0xFFFFF7EC),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildFilterButton(
            "상품명 검색",
            'assets/images/tag.svg',
            SearchFilter.productName,
          ),
          const SizedBox(height: 2),
          _buildFilterButton(
            "사용처 검색",
            'assets/images/house.svg',
            SearchFilter.usage,
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String text, String iconPath, SearchFilter filter) {
    final bool isSelected = _searchFilter == filter;
    return GestureDetector(
      onTap: () {
        setState(() {
          _searchFilter = filter;
          _showFilterButtons = false; // Hide after selection
        });
        _onSearchChanged(); // Re-run search
      },
      child: Container(
        width: 90,
        height: 25,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF1E7DA) : const Color(0xFFFFF7EC),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            const SizedBox(width: 8),
            SvgPicture.asset(
              iconPath,
              width: 11,
              height: 11,
              colorFilter: const ColorFilter.mode(Color(0xFF6A4C4C), BlendMode.srcIn),
            ),
            const SizedBox(width: 6),
            Text(
              text,
              style: const TextStyle(
                fontFamily: 'OngeulipParkDahyeon',
                fontSize: 15,
                color: Color(0xFF6A4C4C),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context, listen: false);
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7EC),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 76, left: 25, right: 25),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _searchController,
                    cursorHeight: 24,
                    style: const TextStyle(
                      fontFamily: 'OngeulipParkDahyeon',
                      fontSize: 28,
                      color: Color(0xFF6A4C4C),
                    ),
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFEFE4D3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.zero,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 21.0, right: 11.0),
                        child: SvgPicture.asset(
                          'assets/images/searchImage.svg',
                          width: 16,
                          height: 16,
                        ),
                      ),
                      prefixIconConstraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      hintText: '검색',
                      hintStyle: const TextStyle(
                        fontFamily: 'OngeulipParkDahyeon',
                        fontSize: 28,
                        color: Color(0xFFCAC2B7),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _showFilterButtons = !_showFilterButtons;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: SvgPicture.asset('assets/images/set.svg'),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: _filteredGifts.isEmpty && _searchController.text.isNotEmpty
                    ? const Center(
                        child: Text(
                          '검색 결과가 없습니다.',
                          style: TextStyle(
                            fontFamily: 'OngeulipParkDahyeon',
                            fontSize: 22,
                            color: Color(0xFF7F7D7D),
                          ),
                        ),
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.only(top: 20),
                        itemCount: _filteredGifts.length,
                        itemBuilder: (context, index) {
                          final gift = _filteredGifts[index];
                          return GiftListItem(
                            gift: gift,
                            documentsPath: viewModel.appDocumentsPath,
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(height: 10),
                      ),
              ),
            ],
          ),
          if (_showFilterButtons)
            Positioned(
              top: 76 + 50 + 3,
              right: 25,
              child: _buildFilterButtons(),
            ),
        ],
      ),
    );
  }
}
