import 'package:beauty/bloc/bloc/auth_bloc.dart';
import 'package:beauty/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class OtpWidget extends StatefulWidget {
  const OtpWidget(
      {Key? key,
      required this.codeController,
      required this.verificationId,
      required this.phoneNo})
      : super(key: key);
  final TextEditingController codeController;
  final String verificationId;
  final String phoneNo;

  @override
  State<OtpWidget> createState() => _OtpWidgetState();
}

class _OtpWidgetState extends State<OtpWidget> {
  final GlobalKey<FormState> _otpFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _otpFormKey,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'A verification code has been sent to ${widget.phoneNo} ',
              style: textTheme.headlineSmall,
            ),
            SizedBox(height: 60.h),
            Pinput(
              length: 6,
              controller: widget.codeController,
              defaultPinTheme: PinTheme(
                width: 56,
                height: 56,
                textStyle: const TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
                decoration: BoxDecoration(
                  border: Border.all(color: kPrimaryColor),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
            InkWell(
              onTap: () {
                if (_otpFormKey.currentState!.validate()) {
                  _verifyOtp(
                      context: context,
                      otp: widget.codeController.text.toString());
                }
              },
              child: Container(
                height: 45.h,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: kPrimaryColor),
                child: Center(
                  child: Text(
                    'Verify OTP',
                    style: textTheme.titleMedium!.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _verifyOtp({required BuildContext context, required String otp}) {
    BlocProvider.of<AuthBloc>(context).add(VerifySentOtpEvent(
        otpCode: otp, verificationId: widget.verificationId));
    widget.codeController.clear();
  }
}
