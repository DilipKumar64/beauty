import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopBigPicture extends StatelessWidget {
  const TopBigPicture({
    super.key,
    required this.context,
  });
  final BuildContext context;
  void onBackIconPressed(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 250.h,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/haircut3.jpg'),
                fit: BoxFit.cover),
            color: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
        ),
        Positioned(
          left: 15,
          top: 30,
          child: InkWell(
            onTap: () => onBackIconPressed(context),
            child: const Icon(
              Icons.arrow_circle_left,
              color: Colors.white,
              size: 30,
            ),
          ),
        )
      ],
    );
  }
}
