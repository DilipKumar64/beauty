import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants.dart';

class CarouselImage extends StatelessWidget {
  const CarouselImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: carouselImages.map(
        (i) {
          return Container(
            color: i,
          );
        },
      ).toList(),
      options: CarouselOptions(
        viewportFraction: 1,
        height: 130.h,
        autoPlay: true,
      ),
    );
  }
}
