import 'package:beauty/constants.dart';
import 'package:beauty/router.dart';
import 'package:beauty/screens/auth/auth_screen.dart';
import 'package:beauty/screens/auth/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return MaterialApp(
            title: 'Amazon cline',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              // useMaterial3: true,
              scaffoldBackgroundColor: kBackgroundColor,
              colorScheme: const ColorScheme.light(primary: kPrimaryColor),
              appBarTheme: const AppBarTheme(
                elevation: 0,
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
              ),
            ),
            onGenerateRoute: (settings) => generateRoute(settings),
            home: const OnboardingScreen(),
          );
        });
  }
}
