import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchTabView extends StatelessWidget {
  const SearchTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7EC),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 76, left: 25, right: 25),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFFEFE4D3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 21.0),
                    child: SvgPicture.asset(
                      'assets/images/searchImage.svg',
                      width: 16,
                      height: 16,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 11.0),
                    child: Text(
                      '검색',
                      style: TextStyle(
                        fontFamily: 'OngeulipParkDahyeon',
                        fontSize: 28,
                        color: Color(0xFFCAC2B7),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: SvgPicture.asset('assets/images/set.svg'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 246),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 53.0),
            child: Text(
              '원하는 필터링으로 검색해보세요!',
              style: TextStyle(
                fontFamily: 'OngeulipParkDahyeon',
                fontSize: 28,
                color: Color(0xFF7F7D7D),
              ),
            ),
          ),
        ],
      ),
    );
  }
}