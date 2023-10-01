import 'package:beauty/modals/gpay_payment_sucess_model.dart';
import 'package:beauty/screens/schedule%20appoinment/bloc/schedule_appoinment_bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay/pay.dart';

import '../../../utils/payment_config.dart';

class GpayButton extends StatelessWidget {
  const GpayButton({super.key, required this.label, required this.totalAmount});
  final String label;
  final String totalAmount;
  @override
  Widget build(BuildContext context) {
    return GooglePayButton(
      paymentConfiguration:
          PaymentConfiguration.fromJsonString(defaultGooglePay),
      onPaymentResult: (result) => onPaymentSucess(context, result),
      width: double.infinity,
      onError: (result) => onPaymentFailed(context, result),
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

  onPaymentSucess(BuildContext context, Map<String, dynamic> result) {
    context.read<ScheduleAppoinmentBloc>().add(GpayPayPaymentSucessEvent(
        gpayPaymentSucessModel: GpayPaymentSucessModel.fromJson(result)));
  }

  onPaymentFailed(BuildContext context, Object? result) {
    context.read<ScheduleAppoinmentBloc>().add(
        const ScheduleAppoinmentErrorEvent(
            errorMessage: 'User cancelled payment'));
  }
}
