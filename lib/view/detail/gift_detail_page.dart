
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gifty_flutter/data/realm/models.dart';
import 'package:path/path.dart' as path;
import 'package:provider/provider.dart';
import 'package:gifty_flutter/view_model/home_view_model.dart';
import 'package:gifty_flutter/view/detail/widgets/delete_confirmation_dialog.dart';

class GiftDetailPage extends StatelessWidget {
  final Gift gift;
  final String documentsPath;

  const GiftDetailPage(
      {super.key, required this.gift, required this.documentsPath});

  @override
  Widget build(BuildContext context) {
    final imageFile = File(path.join(documentsPath, gift.imagePath));
    final formattedExpiryDate =
        '${gift.expiryDate.year}.${gift.expiryDate.month.toString().padLeft(2, '0')}.${gift.expiryDate.day.toString().padLeft(2, '0')}';

    return Scaffold(
      backgroundColor: const Color(0xFFFFF7EC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset('assets/images/backButton.svg'),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 49.58),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      final viewModel = Provider.of<HomeViewModel>(context, listen: false);
                      showDialog(
                        context: context,
                        builder: (context) => DeleteConfirmationDialog(gift: gift, viewModel: viewModel),
                      );
                    },
                    icon: SvgPicture.asset(
                      'assets/images/trash.svg',
                      width: 33,
                      height: 33,
                    ),
                  ),
                  const SizedBox(width: 4),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/images/share.svg',
                      width: 33,
                      height: 33,
                    ),
                  ),
                  const SizedBox(width: 4),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/images/chore.svg',
                      width: 33,
                      height: 33,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 11),
            Padding(
              padding: const EdgeInsets.only(left: 53, right: 49.58),
              child: Container(
                width: 287,
                height: 323,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: imageFile.existsSync()
                      ? DecorationImage(
                          image: FileImage(imageFile),
                          fit: BoxFit.cover,
                        )
                      : null,
                  color: imageFile.existsSync() ? null : Colors.grey[300],
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFCBBDB1),
                      offset: Offset(0, 4),
                      blurRadius: 4,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: imageFile.existsSync()
                    ? null
                    : const Icon(Icons.error, color: Colors.white),
              ),
            ),
            const SizedBox(height: 40),
            _buildDetailRow('상품명', gift.name),
            _buildDetailRow('사용처', gift.usage),
            _buildDetailRow('유효기간', formattedExpiryDate),
            _buildDetailRow('메모', gift.memo ?? ''),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 78),
          SizedBox(
            width: 90,
            child: Text(
              label,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontFamily: 'OngeulipParkDahyeon',
                fontSize: 22,
                color: Color(0xFFCDB9AD),
              ),
            ),
          ),
          const SizedBox(width: 25),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontFamily: 'OngeulipParkDahyeon',
                fontSize: 22,
                color: Color(0xFF6A4C4C),
              ),
            ),
          ),
          const SizedBox(width: 20), // Add some padding to the right
        ],
      ),
    );
  }
}
