import 'package:beauty/modals/gpay_payment_sucess_model.dart';
import 'package:beauty/screens/schedule%20appoinment/bloc/schedule_appoinment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        try {
          GpayPaymentSucessModel payment =
              GpayPaymentSucessModel.fromJson(value);
          context
              .read<ScheduleAppoinmentBloc>()
              .add(GpayPayPaymentSucessEvent(gpayPaymentSucessModel: payment));
        } catch (e) {
          print(e);
        }
        ;
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
