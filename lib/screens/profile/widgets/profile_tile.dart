import 'package:beauty/constants.dart';
import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.title,
    required this.iconData,
  });
  final String title;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              iconData,
              size: 30,
              color: Colors.black,
            ),
            const SizedBox(width: 20),
            Text(
              title,
              style: textTheme.bodyLarge,
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
