import 'package:beauty/screens/notification/screens/notification_screen.dart';
import 'package:beauty/utils/constants.dart';
import 'package:beauty/screens/profile/screens/profile_screen.dart';
import 'package:flutter/material.dart';

import 'package:badges/badges.dart' as badges;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/home/home_screen.dart';
import '../screens/notification/bloc/notification_bloc.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/actualHome';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;
  List<Widget> pages = [
    const HomeScreen(),
    // const Center(
    //   child: Text("search page"),
    // ),
    // const ScheduleAppoinmentScreen(
    //     args: {"serviceType": "Basic - Rs 250", "noOfPeople": '2'}),
    const NotificationScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(index: page, children: pages),
        bottomNavigationBar: NavigationBarTheme(
          data: const NavigationBarThemeData(
            height: 70,
            indicatorColor: kSelectedNavBarBackColor,
          ),
          child: NavigationBar(
            elevation: 3,
            onDestinationSelected: (index) {
              page = index;
              setState(() {});
            },
            selectedIndex: page,
            backgroundColor: const Color(0xfffcfcfc),
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            destinations: [
              const NavigationDestination(
                  icon: Icon(Icons.home_outlined), label: 'home'),
              // NavigationDestination(icon: Icon(Icons.search), label: 'search'),
              // NavigationDestination(icon: Icon(Icons.event), label: 'event'),
              NavigationDestination(
                  icon: badges.Badge(
                      badgeContent:
                          BlocBuilder<NotificationBloc, NotificationState>(
                        builder: (context, state) {
                          return state.appoinment != null
                              ? const Text('1')
                              : const Text('0');
                        },
                      ),
                      badgeStyle:
                          const badges.BadgeStyle(badgeColor: Colors.white),
                      child: const Icon(Icons.notifications_active_outlined)),
                  label: 'notification'),
              const NavigationDestination(
                  icon: Icon(Icons.person_outline_outlined), label: 'profile'),
            ],
          ),
        ));
  }
}
