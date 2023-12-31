import 'package:beauty/screens/auth/screens/email_sign_in_screen.dart';
import 'package:beauty/screens/auth/screens/otp_screen.dart';
import 'package:beauty/screens/auth/screens/sign_up_screen.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/auth_bloc.dart';
import '../../../utils/constants.dart';
import '../../../widgets/bottom_bar.dart';
import '../widgets/custom_round_login_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  static const String routeName = '/auth';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final countryPicker = const FlCountryCodePicker();
  final submitNumberKey = GlobalKey<FormState>();
  final _phoneNoController = TextEditingController();
  final _codeController = TextEditingController();
  CountryCode code =
      const CountryCode(name: 'India', code: 'IN', dialCode: '+91');
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // const Icon(Icons.close),
                    Text(
                      'Help?',
                      style: textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            )),
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
            // Show error message if any error occurs while verifying phone number and otp code
            if (state is PhoneAuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                ),
              );
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
              if (state is PhoneAuthCodeSentSuccess) {
                return OtpWidget(
                  codeController: _codeController,
                  verificationId: state.verificationId,
                  phoneNo: '${code.dialCode}${_phoneNoController.text}',
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
                          'Log in',
                          style: textTheme.labelLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 30.h),
                        InkWell(
                          onTap: () async {
                            CountryCode? local = await countryPicker.showPicker(
                                context: context);
                            // Null check
                            if (local != null) {
                              if (!mounted) return;
                              context
                                  .read<AuthBloc>()
                                  .add(AuthStateUpdated(local));
                            }
                          },
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            height: 50.h,
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    '${state.code.name} (${state.code.dialCode})'),
                                const Icon(Icons.keyboard_arrow_down)
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Form(
                          key: submitNumberKey,
                          child: TextFormField(
                            maxLength: 10,
                            controller: _phoneNoController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value.length < 10) {
                                return " Enter 10 digit mobile no.";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.all(18),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              suffixIcon: const Icon(Icons.check),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'We will send a code to confirm your number to proceed your reservation.',
                          maxLines: 2,
                          style: textTheme.bodyLarge,
                        ),
                        SizedBox(height: 40.h),
                        InkWell(
                          onTap: () {
                            _sendCode(context);
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomRoundLoginButon(
                              logoUrl: 'assets/images/google.png',
                              voidCallback: () {
                                _authenticateWithGoogle(context);
                              },
                            ),
                            CustomRoundLoginButon(
                              logoUrl: 'assets/images/facebook.png',
                              voidCallback: () {},
                            ),
                            CustomRoundLoginButon(
                              logoUrl: 'assets/images/gmail.png',
                              voidCallback: () {
                                Navigator.pushNamed(
                                    context, EmailSignInScreen.routeName);
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'I am a new user, ',
                          style: textTheme.titleMedium,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, EmailSignUpScreen.routeName);
                          },
                          child: Text(
                            'Create Account',
                            style: textTheme.titleMedium!.copyWith(
                                decoration: TextDecoration.underline,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor),
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
      ),
    );
  }

  void _sendCode(context) {
    if (submitNumberKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        SendOtpToPhoneEvent(
            phoneNumber: '${code.dialCode}${_phoneNoController.text}'),
      );
    }
  }

  void _authenticateWithGoogle(context) {
    BlocProvider.of<AuthBloc>(context).add(
      GoogleSignInRequested(),
    );
  }
}
