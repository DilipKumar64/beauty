import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThreeDisplayPictures extends StatelessWidget {
  const ThreeDisplayPictures({
    super.key,
    required this.imageUrl,
  });

  final List<String> imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: ListView.builder(
        itemCount: imageUrl.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 70.h,
              width: 90.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(imageUrl[index])),
            ),
          );
        },
      ),
    );
  }
}
