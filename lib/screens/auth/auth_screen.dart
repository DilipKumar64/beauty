import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  static const String routeName = '/auth';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  /// Default.
  final countryPicker = const FlCountryCodePicker();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
            flexibleSpace: Container(
              color: Colors.white,
            ),
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.close),
                SizedBox(
                  height: 20,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Help',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      Icon(
                        Icons.question_mark_rounded,
                        color: Colors.black,
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Log in',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  height: 55,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('India (+91)'),
                      Icon(Icons.keyboard_arrow_down)
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 55,
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(24.0),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      suffixIcon: const Icon(Icons.check),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'We will send a code to confirm your number to proceed your reservation.',
                  maxLines: 2,
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 40),
                Container(
                  height: 53,
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: kPrimaryColor),
                  child: Center(
                    child: Text(
                      'Continue',
                      style: textTheme.titleMedium,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 1,
                      width: size.width * 0.4,
                      color: Colors.black,
                    ),
                    const Text(
                      'or',
                      style: TextStyle(fontSize: 18),
                    ),
                    Container(
                      height: 1,
                      width: size.width * 0.4,
                      color: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'I am a new user, ',
                  style: TextStyle(fontSize: 18),
                ),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    'Create Account',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
