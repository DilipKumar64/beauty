import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../bloc/bloc/auth_bloc.dart';
import '../../../constants.dart';
import '../../../widgets/bottom_bar.dart';
import '../widgets/custom_round_login_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const routeName = '/sing-in';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailSignUpKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: SizedBox(
          height: 50,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close)),
                Text(
                  'Help?',
                  style: textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            // Navigating to the dashboard screen if the user is authenticated
            Navigator.pushReplacementNamed(context, BottomBar.routeName);
          }
          if (state is AuthError) {
            // Showing the error message if the user has entered invalid credentials
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is Loading) {
              // Showing the loading indicator while the user is signing in
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign Up',
                        style: textTheme.labelLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 100.h),
                      Form(
                        key: emailSignUpKey,
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (value) {
                                String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                                RegExp regExp = RegExp(pattern);
                                if (value == null || value.isEmpty) {
                                  return " Enter 10 digit mobile no.";
                                } else if (!regExp.hasMatch(value)) {
                                  return 'Please enter a valid mobile number';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'email',
                                isDense: true,
                                contentPadding: const EdgeInsets.all(18),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            TextFormField(
                              validator: (value) {
                                String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                                RegExp regExp = RegExp(pattern);
                                if (value == null || value.isEmpty) {
                                  return " Enter 10 digit mobile no.";
                                } else if (!regExp.hasMatch(value)) {
                                  return 'Please enter a valid mobile number';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'password',
                                isDense: true,
                                contentPadding: const EdgeInsets.all(18),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                suffixIcon: const Icon(Icons.check),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40.h),
                      InkWell(
                        onTap: () {
                          if (emailSignUpKey.currentState!.validate()) {
                            Navigator.pushNamed(context, BottomBar.routeName);
                          }
                        },
                        child: Container(
                          height: 45.h,
                          width: size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: kPrimaryColor),
                          child: Center(
                            child: Text(
                              'Continue',
                              style: textTheme.titleMedium!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 1,
                            width: size.width * 0.4,
                            color: Colors.black,
                          ),
                          Text('or', style: textTheme.titleMedium),
                          Container(
                            height: 1,
                            width: size.width * 0.4,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Center(
                        child: CustomRoundLoginButon(
                          logoUrl: 'assets/images/google.png',
                          voidCallback: () {
                            _authenticateWithGoogle(context);
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ));
  }

  void _authenticateWithGoogle(context) {
    BlocProvider.of<AuthBloc>(context).add(
      GoogleSignInRequested(),
    );
  }
}
