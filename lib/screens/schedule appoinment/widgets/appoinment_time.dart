import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants.dart';

class AppoinmentTme extends StatelessWidget {
  const AppoinmentTme({
    super.key,
    required this.list,
  });
  final List<String> list;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 20,
          mainAxisExtent: 45.h,
        ),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(), borderRadius: BorderRadius.circular(5)),
              child: Center(
                  child: Text(
                '10:00am',
                style: textTheme.bodyMedium!.copyWith(color: kPrimaryColor),
              )),
            ),
          );
        });
  }
}
