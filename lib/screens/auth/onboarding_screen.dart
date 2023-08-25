import 'package:beauty/screens/auth/auth_screen.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

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
            const SizedBox(height: 40),
            Center(
              child: SizedBox(
                height: 350,
                width: 200,
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
            const SizedBox(height: 50),
            Text(
              'Saloon & Spa',
              style: textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            Text('Book saloon & spa from home at your finger tips.',
                style: textTheme.labelLarge),
            const SizedBox(height: 40),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, AuthScreen.routeName);
              },
              child: Container(
                height: 55,
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
                    const SizedBox(width: 10),
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
