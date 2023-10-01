import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, Phanindra ',
              style:
                  textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 10),
            Text(
              'Find the service you want',
              style: textTheme.bodyMedium,
            ),
          ],
        ),
        Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: kPrimaryColor, borderRadius: BorderRadius.circular(50)),
            child: const Icon(
              Icons.search,
              color: Colors.white,
            ))
      ],
    );
  }
}
