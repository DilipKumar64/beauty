import 'package:beauty/screens/auth/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  static const routeName = '/onboarding-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40.h),
            Center(
              child: SizedBox(
                height: 300.h,
                width: 200.w,
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
            SizedBox(height: 50.h),
            Text(
              'Saloon & Spa',
              style: textTheme.titleLarge,
            ),
            SizedBox(height: 10.h),
            Text('Book saloon & spa from home at your finger tips.',
                style: textTheme.labelLarge),
            SizedBox(height: 40.h),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, AuthScreen.routeName);
              },
              child: Container(
                height: 45.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: kPrimaryColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Let\'s begin',
                      style:
                          textTheme.titleMedium!.copyWith(color: Colors.white),
                    ),
                    SizedBox(width: 10.h),
                    const Icon(
                      Icons.arrow_circle_right_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
