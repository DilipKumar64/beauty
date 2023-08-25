import 'package:beauty/screens/auth/auth_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );

    default:
      return MaterialPageRoute(
          builder: (_) => const Center(
                child: Text('4o4 page not found'),
              ));
  }
}
