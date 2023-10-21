import 'package:beauty/screens/notification/bloc/notification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/constants.dart';
import '../../home/widgets/custom_app_bar.dart';
import '../widget/appoinment_detal_component.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16.0,
            top: 50.0,
          ),
          child: BlocConsumer<NotificationBloc, NotificationState>(
            listener: (context, state) {
              // if (state.homeStateStatus == HomeStateStatus.failed) {
              //   HelperComponent.showSnackbar(context, state.errorMessage!);
              // }
            },
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomAppBar(),
                  const SizedBox(height: 20),
                  Text(
                    'Notifications',
                    style: textTheme.bodyLarge!.copyWith(
                        color: kPrimaryColor,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  const AppoinmentDeatialComponent()
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
