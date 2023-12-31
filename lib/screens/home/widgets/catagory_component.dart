import 'package:beauty/utils/constants.dart';
import 'package:beauty/screens/single%20service/screens/single_service_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';

class CatagoryComponent extends StatelessWidget {
  const CatagoryComponent({
    super.key,
  });
  void navigateToSingleCategoryPage(BuildContext context, String title) {
    Navigator.pushNamed(context, SingleServiceScreen.routeName,
        arguments: title);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What are you looking for?',
              style:
                  textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w800),
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
                  return GestureDetector(
                    onTap: () => navigateToSingleCategoryPage(
                        context, categoryImages[index]['title']!),
                    child: Column(
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
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
