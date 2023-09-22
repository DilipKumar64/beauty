import 'dart:io';
import 'dart:developer' as lgr;
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

import '../../../payment_config.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});
  static const String routeName = '/payment-screen';
  @override
  Widget build(BuildContext context) {
    String os = Platform.operatingSystem;
    Widget googlePayButton = GooglePayButton(
      paymentConfiguration:
          PaymentConfiguration.fromJsonString(defaultGooglePay),
      onPaymentResult: (value) {
        lgr.log(value.toString());
      },
      paymentItems: const [
        PaymentItem(
          label: 'Item A',
          amount: '0.01',
          status: PaymentItemStatus.final_price,
        ),
        PaymentItem(
          label: 'Item B',
          amount: '0.01',
          status: PaymentItemStatus.final_price,
        ),
        PaymentItem(
          amount: '0.02',
          label: 'Total',
          status: PaymentItemStatus.final_price,
        ),
      ],
      // ignore: prefer_const_constructors
      loadingIndicator: CircularProgressIndicator(),
    );
    return Placeholder(
      child: googlePayButton,
    );
  }
}
