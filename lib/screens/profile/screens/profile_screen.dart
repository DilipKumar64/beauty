import 'package:beauty/bloc/bloc/auth_bloc.dart';
import 'package:beauty/constants.dart';
import 'package:beauty/screens/auth/screens/auth_screen.dart';
import 'package:beauty/screens/profile/widgets/profile_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static const routeName = '/profile-screen';
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Profile',
                    style: textTheme.headlineSmall,
                  ),
                  const Text(
                    'Edit',
                    style: TextStyle(
                        fontSize: 18,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Stack(children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images2.alphacoders.com/132/1323416.jpeg'),
                  radius: 50,
                ),
                Positioned(
                    bottom: 30,
                    right: 0,
                    child: SizedBox(
                      height: 5,
                      child: Icon(
                        Icons.edit,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ))
              ]),
              const SizedBox(height: 10),
              Text(
                'Himanshu Raghav',
                style:
                    textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700),
              ),
              Text(
                'himanshuraghav@gmail.com',
                style: textTheme.bodyLarge,
              ),
              const SizedBox(height: 5),
              const Divider(thickness: 1),
              const SizedBox(height: 10),
              ProfileTile(
                  title: 'Home', iconData: Icons.home_outlined, fun: () {}),
              ProfileTile(
                  title: 'Notification',
                  iconData: Icons.notifications_active_outlined,
                  fun: () {}),
              ProfileTile(
                  title: 'My bookings',
                  iconData: Icons.book_outlined,
                  fun: () {}),
              ProfileTile(
                  title: 'User invoice', iconData: Icons.copy, fun: () {}),
              ProfileTile(
                  title: 'Cart',
                  iconData: Icons.shopping_cart_outlined,
                  fun: () {}),
              ProfileTile(
                  title: 'Report an issue',
                  iconData: Icons.question_mark,
                  fun: () {}),
              ProfileTile(title: 'About Us', iconData: Icons.menu, fun: () {}),
              BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is UnAuthenticated) {
                    Navigator.pushNamed(context, AuthScreen.routeName);
                  }
                },
                child: ProfileTile(
                    title: 'Sign out',
                    iconData: Icons.logout_rounded,
                    fun: () {
                      print('dfsda');
                      BlocProvider.of<AuthBloc>(context)
                          .add(SignOutRequested());
                    }),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
