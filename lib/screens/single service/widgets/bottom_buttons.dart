import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: 100.h,
      color: const Color(0xffe2f5fa),
      child: GestureDetector(
        onTap: () {
          print('je;;p');
        },
        child: Column(
          children: [
            Container(
              height: 53,
              // width: size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: kPrimaryColor),
              child: Center(
                child: Text(
                  'Proceed To Pay',
                  style: textTheme.titleMedium!.copyWith(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'Save for later',
              style: textTheme.bodyMedium,
            )
          ],
        ),
      ),
    );
  }
}
