import 'package:beauty/constants.dart';
import 'package:flutter/material.dart';

class CatagoryComponent extends StatelessWidget {
  const CatagoryComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'What are you looking for?',
          style: textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 200,
          child: GridView.builder(
            itemCount: categoryImages.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10, crossAxisCount: 4),
            itemBuilder: (context, index) {
              categoryImages[index]['image'];
              return Column(
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundColor: const Color(0xffe2f5fa),
                    child: Image.asset(categoryImages[index]['image']!),
                  ),
                  Text(
                    categoryImages[index]['title']!,
                    style: textTheme.bodySmall,
                  )
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
