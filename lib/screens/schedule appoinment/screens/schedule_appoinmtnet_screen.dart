import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants.dart';
import '../widgets/appoinment_time.dart';

class ScheduleAppoinmentScreen extends StatefulWidget {
  const ScheduleAppoinmentScreen({super.key});
  static const String routeName = '/shcedule-appoinment';
  @override
  State<ScheduleAppoinmentScreen> createState() =>
      _ScheduleAppoinmentScreenState();
}

class _ScheduleAppoinmentScreenState extends State<ScheduleAppoinmentScreen> {
  List<String> morningList = ['9:00am', '10:00am', '11:00am'];
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
              SizedBox(height: 10.h),
              Text(
                'Morning',
                style:
                    textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: 100.h,
                // width: double.maxFinite,
                child: AppoinmentTme(
                  list: morningList,
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                'Afternoon',
                style:
                    textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
