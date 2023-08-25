import 'package:beauty/constants.dart';
import 'package:beauty/screens/profile/widgets/profile_tile.dart';
import 'package:flutter/material.dart';

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
              const ProfileTile(title: 'Home', iconData: Icons.home_outlined),
              const ProfileTile(
                  title: 'Notification',
                  iconData: Icons.notifications_active_outlined),
              const ProfileTile(
                  title: 'My bookings', iconData: Icons.book_outlined),
              const ProfileTile(title: 'User invoice', iconData: Icons.copy),
              const ProfileTile(
                  title: 'Cart', iconData: Icons.shopping_cart_outlined),
              const ProfileTile(
                  title: 'Report an issue', iconData: Icons.question_mark),
              const ProfileTile(title: 'About Us', iconData: Icons.menu),
              const ProfileTile(
                  title: 'Sign out', iconData: Icons.logout_rounded),
            ],
          ),
        ),
      ),
    ));
  }
}
