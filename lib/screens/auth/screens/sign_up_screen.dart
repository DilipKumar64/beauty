import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../bloc/bloc/auth_bloc.dart';
import '../../../constants.dart';
import '../../../repositories/auth_repository.dart';
import '../widgets/custom_round_login_button.dart';
import '../widgets/custom_text_field.dart';

class EmailSignUpScreen extends StatefulWidget {
  const EmailSignUpScreen({super.key});
  static const routeName = '/sing-up';

  @override
  State<EmailSignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<EmailSignUpScreen> {
  final emailSignUpKey = GlobalKey<FormState>();
  AuthBloc authBloc = AuthBloc(authRepository: AuthRepository());
  bool obscureText = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
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
      body: BlocBuilder<AuthBloc, AuthState>(
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Email Sign Up',
                  style: textTheme.labelLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 100.h),
                Form(
                  key: emailSignUpKey,
                  child: Column(
                    children: [
                      CustomTextField(
                          isPassword: false,
                          controller: emailController,
                          hintText: 'Email'),
                      SizedBox(height: 20.h),
                      CustomTextField(
                          controller: passwordController,
                          isPassword: true,
                          hintText: 'Password'),
                    ],
                  ),
                ),
                SizedBox(height: 40.h),
                InkWell(
                  onTap: () {
                    if (emailSignUpKey.currentState!.validate()) {
                      BlocProvider.of<AuthBloc>(context).add(SignUpRequested(
                          emailController.text, passwordController.text));
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
          );
        },
      ),
    ));
  }

  void _authenticateWithGoogle(context) {
    BlocProvider.of<AuthBloc>(context).add(
      GoogleSignInRequested(),
    );
  }
}
