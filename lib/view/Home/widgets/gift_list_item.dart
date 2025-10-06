import 'package:flutter/material.dart';
import 'package:gifty_flutter/core/theme/app_colors.dart';
import 'package:gifty_flutter/data/realm/gift.dart';

class GiftListItem extends StatelessWidget {
  final Gift gift;

  const GiftListItem({super.key, required this.gift});

  @override
  Widget build(BuildContext context) {
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
              child: Container( // Placeholder for the image
                width: 73.3,
                height: 73.3,
                color: Colors.grey[300],
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
              gift.vendor,
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
              // Assuming expiryDate is a DateTime object.
              // You might need to format it.
              '${gift.expiryDate.year}.${gift.expiryDate.month}.${gift.expiryDate.day}',
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
