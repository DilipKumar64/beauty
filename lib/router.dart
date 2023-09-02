import 'package:beauty/screens/auth/screens/auth_screen.dart';
import 'package:beauty/screens/auth/screens/email_sign_in_screen.dart';
import 'package:beauty/screens/auth/screens/onboarding_screen.dart';
import 'package:beauty/screens/auth/screens/sign_up_screen.dart';
import 'package:beauty/screens/payment/screens/payment_screen.dart';
import 'package:beauty/screens/schedule%20appoinment/screens/schedule_appoinmtnet_screen.dart';
import 'package:beauty/screens/single%20service/screens/single_service_screen.dart';
import 'package:beauty/screens/profile/screens/profile_screen.dart';
import 'package:beauty/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );
    case OnboardingScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const OnboardingScreen(),
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );
    case ProfileScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ProfileScreen(),
      );
    case SingleServiceScreen.routeName:
      var title = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SingleServiceScreen(title: title),
      );
    case PaymentScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const PaymentScreen(),
      );
    case EmailSignUpScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const EmailSignUpScreen(),
      );
    case EmailSignInScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const EmailSignInScreen(),
      );
    case ScheduleAppoinmentScreen.routeName:
      var args = routeSettings.arguments as Map<String, String>;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ScheduleAppoinmentScreen(args: args),
      );
    default:
      return MaterialPageRoute(
          builder: (_) => const Center(
                child: Text('4o4 page not found'),
              ));
  }
}
