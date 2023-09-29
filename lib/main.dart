import 'package:beauty/constants.dart';
import 'package:beauty/firebase_options.dart';
import 'package:beauty/repositories/auth_repository.dart';
import 'package:beauty/repositories/schedule_appoinment_repository.dart';
import 'package:beauty/router.dart';
import 'package:beauty/screens/admin/bloc/admin_pannel_bloc.dart';
import 'package:beauty/screens/auth/bloc/auth_bloc.dart';
import 'package:beauty/screens/auth/screens/onboarding_screen.dart';
import 'package:beauty/screens/schedule%20appoinment/bloc/schedule_appoinment_bloc.dart';
import 'package:beauty/screens/single%20service/bloc/single_service_bloc.dart';
import 'package:beauty/widgets/bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
          return MultiRepositoryProvider(
            providers: [
              RepositoryProvider(create: (context) => AuthRepository()),
              RepositoryProvider(
                  create: (context) => ScheduleAppoinmentRepository())
            ],
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                    create: (context) => AuthBloc(
                        authRepository:
                            RepositoryProvider.of<AuthRepository>(context))),
                BlocProvider(create: (context) => SingleServiceBloc()),
                BlocProvider(
                    create: ((context) => ScheduleAppoinmentBloc(
                          repository: RepositoryProvider.of<
                              ScheduleAppoinmentRepository>(context),
                        ))),
                BlocProvider(create: (context) => AdminPannelBloc())
              ],
              child: MaterialApp(
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
                home: StreamBuilder<User?>(
                    stream: FirebaseAuth.instance.authStateChanges(),
                    builder: (context, snapshot) {
                      // if user logged in we show bottom bar
                      if (snapshot.hasData) {
                        return const BottomBar();
                      }
                      // if user  is not logged in we show onboarding screen
                      return const OnboardingScreen();
                    }),
              ),
            ),
          );
        });
  }
}
