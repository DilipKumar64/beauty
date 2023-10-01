import 'package:beauty/utils/constants.dart';
import 'package:flutter/material.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: const Color(0xfff7c890),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: size.width * 0.5,
              child: Text(
                'Use BEAUTY20 to get 50% discount',
                maxLines: 2,
                style: textTheme.titleMedium,
              ),
            ),
            const Center(
              child: Icon(
                Icons.arrow_circle_right_sharp,
                size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
