import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuccessToast extends StatelessWidget {
  const SuccessToast({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        width: 230,
        height: 110,
        decoration: BoxDecoration(
          color: const Color(0xFFFFF7EC),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SvgPicture.asset(
                'assets/images/check.svg',
                width: 38,
                height: 38,
              ),
            ),
            const SizedBox(height: 11),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                '정상적으로 등록되었습니다',
                style: TextStyle(
                  fontFamily: 'OngeulipParkDahyeon',
                  fontSize: 23,
                  color: Color(0xFF6A4C4C),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
