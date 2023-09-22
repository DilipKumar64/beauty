import 'package:flutter/material.dart';
import 'package:pay/pay.dart';
import 'dart:developer' as lgr;

import '../../../payment_config.dart';

class GpayButton extends StatelessWidget {
  const GpayButton({super.key, required this.label, required this.totalAmount});
  final String label;
  final String totalAmount;
  @override
  Widget build(BuildContext context) {
    return GooglePayButton(
      paymentConfiguration:
          PaymentConfiguration.fromJsonString(defaultGooglePay),
      onPaymentResult: (value) {
        lgr.log(value.toString());
      },
      width: double.infinity,
      paymentItems: [
        PaymentItem(
          label: label,
          amount: totalAmount,
          status: PaymentItemStatus.final_price,
        ),
      ],
      // ignore: prefer_const_constructors
      loadingIndicator: CircularProgressIndicator(),
    );
  }
}
