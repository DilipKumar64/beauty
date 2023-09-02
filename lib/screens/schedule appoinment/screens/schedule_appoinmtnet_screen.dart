import 'package:beauty/bloc/schedule%20appoinment/schedule_appoinment_bloc.dart';
import 'package:beauty/screens/payment/screens/payment_screen.dart';
import 'package:beauty/screens/single%20service/widgets/bottom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants.dart';
import '../widgets/appoinment_time.dart';

class ScheduleAppoinmentScreen extends StatefulWidget {
  const ScheduleAppoinmentScreen({
    super.key,
    required this.args,
  });
  static const String routeName = '/shcedule-appoinment';
  @override
  State<ScheduleAppoinmentScreen> createState() =>
      _ScheduleAppoinmentScreenState();
  final Map<String, String> args;
}

class _ScheduleAppoinmentScreenState extends State<ScheduleAppoinmentScreen> {
  List<String> morningList = ['09:00am', '10:00am', '11:00am'];
  List<String> afternonList = [
    '01:00pm',
    '02:00pm',
    '03:00pm',
    '04:00pm',
    '05:00pm',
    '06:00pm',
  ];
  List<String> eveningList = ['07:00pm', '08:00pm', '09:00pm'];
  @override
  void initState() {
    BlocProvider.of<ScheduleAppoinmentBloc>(context).emit(
        const ScheduleAppoinmentTimeSelected(
            selectedTime: {"listId": 0, "selectedIndex": 0}));
    super.initState();
  }

  int extractPrice(String priceString) {
    int price = 250;
    int priceStringLength = priceString.length;
    String temp = '';
    for (int i = priceStringLength - 4; i <= priceStringLength - 1; i++) {
      temp = temp + priceString[i];
    }
    price = int.parse(temp);
    return price;
  }

  int returnFinalAmmount(String noOfPeople, String priceString) {
    int amount = 250;
    amount = int.parse(noOfPeople) * extractPrice(priceString);
    return amount;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 24.0, right: 24.0, top: 24.0, bottom: 8),
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
              const Divider(thickness: 1, color: Colors.black45),
              SizedBox(height: 10.h),
              Text(
                'Morning',
                style:
                    textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: 40.h,
                child: BlocBuilder<ScheduleAppoinmentBloc,
                    ScheduleAppoinmentState>(
                  builder: (context, state) {
                    if (state is ScheduleAppoinmentTimeSelected) {
                      return AppoinmentTme(
                        selectedListId: state.selectedTime["listId"]!,
                        listId: 0,
                        list: morningList,
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                'Afternoon',
                style:
                    textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: 95.h,
                child: BlocBuilder<ScheduleAppoinmentBloc,
                    ScheduleAppoinmentState>(
                  builder: (context, state) {
                    if (state is ScheduleAppoinmentTimeSelected) {
                      return AppoinmentTme(
                        selectedListId: state.selectedTime["listId"]!,
                        listId: 1,
                        list: afternonList,
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                'Evening',
                style:
                    textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: 40.h,
                child: BlocBuilder<ScheduleAppoinmentBloc,
                    ScheduleAppoinmentState>(
                  builder: (context, state) {
                    if (state is ScheduleAppoinmentTimeSelected) {
                      return AppoinmentTme(
                        selectedListId: state.selectedTime["listId"]!,
                        listId: 2,
                        list: eveningList,
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
              SizedBox(height: 10.h),
              const Divider(thickness: 1, color: Colors.black45),
              SizedBox(height: 10.h),
              Text(
                'Service details',
                style: textTheme.bodyLarge,
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Service type',
                          style: textTheme.bodyLarge!.copyWith(
                              letterSpacing: 1,
                              color: const Color.fromARGB(255, 97, 97, 97)),
                        ),
                        Text(
                          widget.args['serviceType']!,
                          style: textTheme.bodyLarge!.copyWith(
                            color: const Color.fromARGB(255, 97, 97, 97),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'No.of people',
                          style: textTheme.bodyLarge!.copyWith(
                              letterSpacing: 1,
                              color: const Color.fromARGB(255, 97, 97, 97)),
                        ),
                        Text(
                          widget.args['noOfPeople']!,
                          style: textTheme.bodyLarge!.copyWith(
                            color: const Color.fromARGB(255, 97, 97, 97),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10.h),
                    const Divider(thickness: 2, color: Colors.black45),
                    SizedBox(height: 5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: textTheme.bodyLarge!.copyWith(
                              letterSpacing: 1, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '${widget.args['noOfPeople']!} x ${extractPrice(widget.args['serviceType']!)} = Rs. ${returnFinalAmmount(widget.args['noOfPeople']!, widget.args['serviceType']!)}',
                          style: textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 5.h),
                    const Divider(thickness: 2, color: Colors.black45),
                  ],
                ),
              ),
              SizedBox(height: 5.h),
              BottomButtons(
                onTap: () {
                  Navigator.pushNamed(context, PaymentScreen.routeName);
                },
              )
            ],
          ),
        ),
      ),
    ));
  }
}
