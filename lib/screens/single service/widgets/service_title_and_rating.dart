import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants.dart';

class ServiceTitleAndRating extends StatelessWidget {
  const ServiceTitleAndRating({
    super.key,
    required this.title,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    double rating = 3;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style:
                  textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w600),
            ),
            Text(
              'Time: 1 hour',
              style: textTheme.bodySmall!.copyWith(color: Colors.black54),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RatingBar.builder(
              initialRating: rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemSize: 15.h,
              itemCount: 5,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: kPrimaryColor,
              ),
              onRatingUpdate: (newRating) {
                rating = newRating;
              },
            ),
            Text(
              '1281 rating',
              style: textTheme.bodyLarge,
            ),
          ],
        ),
      ],
    );
  }
}
