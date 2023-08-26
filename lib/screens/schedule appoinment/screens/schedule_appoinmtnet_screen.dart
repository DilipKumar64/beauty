import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants.dart';

class ScheduleAppoinmentScreen extends StatefulWidget {
  const ScheduleAppoinmentScreen({super.key});
  static const String routeName = '/shcedule-appoinment';
  @override
  State<ScheduleAppoinmentScreen> createState() =>
      _ScheduleAppoinmentScreenState();
}

class _ScheduleAppoinmentScreenState extends State<ScheduleAppoinmentScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Choose time',
                  style: textTheme.headlineSmall!
                      .copyWith(fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(height: 30.h),
              Text(
                'Choose time period',
                style: textTheme.titleMedium!.copyWith(fontSize: 22),
              ),
              const SizedBox(height: 5),
              const Divider(thickness: 1),
              const SizedBox(height: 10),
              Text(
                'Morning',
                style: textTheme.bodyMedium,
              )
            ],
          ),
        ),
      ),
    ));
  }
}
