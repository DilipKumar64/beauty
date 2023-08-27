import 'package:beauty/screens/auth/auth_screen.dart';
import 'package:beauty/screens/auth/onboarding_screen.dart';
import 'package:beauty/screens/home/single_service_screen.dart';
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

    default:
      return MaterialPageRoute(
          builder: (_) => const Center(
                child: Text('4o4 page not found'),
              ));
  }
}
