import 'package:beauty/utils/constants.dart';
import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.title,
    required this.iconData,
    required this.fun,
  });
  final String title;
  final IconData iconData;
  final VoidCallback fun;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: fun,
          child: Row(
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
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
