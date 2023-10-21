import 'package:beauty/modals/gpay_payment_sucess_model.dart';
import 'package:beauty/screens/home/helper_component.dart';
import 'package:beauty/screens/notification/bloc/notification_bloc.dart';
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
      loadingIndicator: const CircularProgressIndicator(),
    );
  }

  onPaymentSucess(BuildContext context, Map<String, dynamic> result) {
    context.read<ScheduleAppoinmentBloc>().add(GpayPayPaymentSucessEvent(
        gpayPaymentSucessModel: GpayPaymentSucessModel.fromJson(result)));
    Navigator.pop(context);
    Navigator.pop(context);
    HelperComponent.showSnackbar(context, "Appoinment booked sucessfully!!");
    context.read<NotificationBloc>().add(NotificationInitialEvent());
  }

  onPaymentFailed(BuildContext context, Object? result) {
    context.read<ScheduleAppoinmentBloc>().add(
        const ScheduleAppoinmentErrorEvent(
            errorMessage: 'User cancelled payment'));
  }
}
