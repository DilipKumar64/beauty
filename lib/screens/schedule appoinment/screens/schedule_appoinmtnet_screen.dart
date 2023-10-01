import 'package:beauty/screens/payment/widgets/google_pay_button.dart';
import 'package:beauty/screens/single%20service/bloc/single_service_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants.dart';
import '../bloc/schedule_appoinment_bloc.dart';
import '../widgets/appoinment_time.dart';

class ScheduleAppoinmentScreen extends StatelessWidget {
  const ScheduleAppoinmentScreen({
    super.key,
    required this.args,
  });
  static const String routeName = '/shcedule-appoinment';
  final Map<String, String> args;
  // @override
  @override
  Widget build(BuildContext context) {
    List<TimeOfDay> morningList = [
      const TimeOfDay(hour: 9, minute: 0),
      const TimeOfDay(hour: 10, minute: 0),
      const TimeOfDay(hour: 11, minute: 0),
    ];

    List<TimeOfDay> afternonList = [
      const TimeOfDay(hour: 13, minute: 0),
      const TimeOfDay(hour: 14, minute: 0),
      const TimeOfDay(hour: 15, minute: 0),
      const TimeOfDay(hour: 16, minute: 0),
      const TimeOfDay(hour: 17, minute: 0),
      const TimeOfDay(hour: 18, minute: 0),
    ];
    List<TimeOfDay> eveningList = [
      const TimeOfDay(hour: 19, minute: 0),
      const TimeOfDay(hour: 20, minute: 0),
      const TimeOfDay(hour: 21, minute: 0),
    ];
    int extractPrice(String priceString) {
      int price = 250;
      int priceStringLength = priceString.length;
      String temp = '';
      for (int i = priceStringLength - 3; i <= priceStringLength - 1; i++) {
        temp = temp + priceString[i];
      }

      price = int.parse(temp);
      return price;
    }

    String returnFinalAmmount(String noOfPeople, String priceString) {
      String amount = '250';
      amount = '${int.parse(noOfPeople) * extractPrice(priceString)}';
      return amount;
    }

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 24.0, right: 24.0, top: 24.0, bottom: 8),
          child: BlocListener<ScheduleAppoinmentBloc, ScheduleAppoinmentState>(
            listener: (context, state) {
              if (state is ScheduleAppoinmentErrorState) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.errorMessage)));
              } else if (state is GpaySucessState) {
                SingleServiceState singleServiceState =
                    context.read<SingleServiceBloc>().state;
                context.read<ScheduleAppoinmentBloc>().add(
                      SaveAppoinmentDataToFirebaseEvent(
                          noOfPeople: args['noOfPeople']!,
                          serviceType: args['serviceType']!,
                          totalPrice: returnFinalAmmount(
                              args['noOfPeople']!, args['serviceType']!),
                          date: singleServiceState.scheduledDate,
                          time: state.time),
                    );
              }
            },
            child: BlocBuilder<ScheduleAppoinmentBloc, ScheduleAppoinmentState>(
              builder: (context, state) {
                return Column(
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
                      style: textTheme.bodyLarge!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10.h),
                    SizedBox(
                        height: 40.h,
                        child: AppoinmentTme(
                          state: state,
                          selectedIndex: state.selectedIndex,
                          selectedListId: state.selectedListId,
                          listId: 0,
                          list: morningList,
                        )),
                    SizedBox(height: 15.h),
                    Text(
                      'Afternoon',
                      style: textTheme.bodyLarge!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10.h),
                    SizedBox(
                        height: 95.h,
                        child: AppoinmentTme(
                          state: state,
                          selectedIndex: state.selectedIndex,
                          selectedListId: state.selectedListId,
                          listId: 1,
                          list: afternonList,
                        )),
                    SizedBox(height: 15.h),
                    Text(
                      'Evening',
                      style: textTheme.bodyLarge!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10.h),
                    SizedBox(
                        height: 40.h,
                        child: AppoinmentTme(
                          selectedIndex: state.selectedIndex,
                          selectedListId: state.selectedListId,
                          listId: 2,
                          list: eveningList,
                          state: state,
                        )),
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
                                    color:
                                        const Color.fromARGB(255, 97, 97, 97)),
                              ),
                              Text(
                                args['serviceType']!,
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
                                    color:
                                        const Color.fromARGB(255, 97, 97, 97)),
                              ),
                              Text(
                                args['noOfPeople']!,
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
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '${args['noOfPeople']!} x ${extractPrice(args['serviceType']!)} = Rs. ${returnFinalAmmount(args['noOfPeople']!, args['serviceType']!)}',
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
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      height: 100.h,
                      color: const Color(0xffe2f5fa),
                      child: GestureDetector(
                        onTap: () {},
                        child: Column(
                          children: [
                            GpayButton(
                                label: args['serviceType']!,
                                totalAmount: returnFinalAmmount(
                                    args['noOfPeople']!, args['serviceType']!)),
                            SizedBox(height: 10.h),
                            Text(
                              'Save for later',
                              style: textTheme.bodyMedium,
                            )
                          ],
                        ),
                      ),
                    ),
                    // BottomButtons(
                    //   onTap: () {
                    //     Navigator.pushNamed(context, PaymentScreen.routeName);
                    //   },
                    // )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    ));
  }
}
