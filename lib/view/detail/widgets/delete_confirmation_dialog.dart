import 'package:flutter/material.dart';
import 'package:gifty_flutter/data/realm/models.dart';
import 'package:gifty_flutter/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  final Gift gift;
  final HomeViewModel viewModel;

  const DeleteConfirmationDialog({super.key, required this.gift, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFFFFF7EC),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        width: 330,
        height: 212,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 25, left: 30, right: 30),
              child: Text(
                '사용 완료한 교환권이 맞나요?',
                style: TextStyle(
                  fontFamily: 'OngeulipParkDahyeon',
                  fontSize: 25,
                  color: Color(0xFF6A4C4C),
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.visible,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              """한 번 삭제한 교환권은
다시 복구할 수 없어요.""",
              style: TextStyle(
                fontFamily: 'OngeulipParkDahyeon',
                fontSize: 20,
                color: Color(0xFF9B1C1C),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    viewModel.deleteGift(gift);
                    Navigator.of(context).pop(); // Close the dialog
                    Navigator.of(context).pop(); // Go back from detail page
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6A4C4C),
                    fixedSize: const Size(115.06, 49.47),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text(
                    '네',
                    style: TextStyle(
                      fontFamily: 'OngeulipParkDahyeon',
                      fontSize: 22,
                      color: Color(0xFFFFF7EC),
                    ),
                  ),
                ),
                const SizedBox(width: 13.81),
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFF7EC),
                    fixedSize: const Size(115.06, 49.47),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    side: const BorderSide(
                      width: 1,
                      color: Color(0xFF6A4C4C),
                    ),
                  ),
                  child: const Text(
                    '아니요',
                    style: TextStyle(
                      fontFamily: 'OngeulipParkDahyeon',
                      fontSize: 22,
                      color: Color(0xFF6A4C4C),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}