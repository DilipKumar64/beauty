import 'package:beauty/screens/admin/screens/add_service_screen.dart';
import 'package:flutter/material.dart';

class AdminPannelScreen extends StatelessWidget {
  const AdminPannelScreen({super.key});
  static const String routeName = '/admin-pannel';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin pannel'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24).copyWith(top: 8),
        child: Column(
          children: [
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, AddServiceScreen.routeName);
              },
              child: const Text('Add new service'),
            ),
          ],
        ),
      ),
    );
  }
}
