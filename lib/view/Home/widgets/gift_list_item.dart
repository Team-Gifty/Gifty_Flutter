import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gifty_flutter/core/theme/app_colors.dart';
import 'package:gifty_flutter/data/realm/models.dart';
import 'package:path/path.dart' as path;

class GiftListItem extends StatelessWidget {
  final Gift gift;
  final String documentsPath;

  const GiftListItem(
      {super.key, required this.gift, required this.documentsPath});

  @override
  Widget build(BuildContext context) {
    final month = gift.expiryDate.month.toString().padLeft(2, '0');
    final day = gift.expiryDate.day.toString().padLeft(2, '0');
    final formattedDate = '- ${gift.expiryDate.year}. $month. $day';
    final imageFile = File(path.join(documentsPath, gift.imagePath));

    return Container(
      height: 89,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        color: AppColors.giftCellBackground,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 8,
            left: 13,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(3),
              child: imageFile.existsSync()
                  ? Image.file(
                      imageFile,
                      width: 73.3,
                      height: 73.3,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      width: 73.3,
                      height: 73.3,
                      color: Colors.grey[300],
                      child: const Icon(Icons.error, color: Colors.white),
                    ),
            ),
          ),
          Positioned(
            top: 15,
            left: 13 + 73.3 + 20,
            right: 15,
            child: Text(
              gift.name,
              style: const TextStyle(
                fontFamily: 'OngeulipConcon',
                fontSize: 11,
                color: AppColors.sortText,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Positioned(
            top: 15 + 11 + 11, // gift name (11) + spacing (11)
            left: 13 + 73.3 + 20,
            child: Text(
              gift.usage,
              style: const TextStyle(
                fontFamily: 'OngeulipConcon',
                fontSize: 9,
                color: AppColors.sortText,
              ),
            ),
          ),
          Positioned(
            bottom: 9,
            right: 12,
            child: Text(
              formattedDate,
              style: const TextStyle(
                fontFamily: 'OngeulipConcon',
                fontSize: 12,
                color: AppColors.sortText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
