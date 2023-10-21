import 'package:beauty/utils/constants.dart';
import 'package:beauty/screens/schedule%20appoinment/screens/schedule_appoinmtnet_screen.dart';
import 'package:beauty/screens/single%20service/bloc/single_service_bloc.dart';
import 'package:beauty/screens/single%20service/widgets/three_display_pictures.dart';
import 'package:beauty/screens/single%20service/widgets/top_big_picture.dart';
import 'package:beauty/screens/single%20service/widgets/custom_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';

import '../widgets/bottom_buttons.dart';
import '../widgets/service_title_and_rating.dart';

class SingleServiceScreen extends StatelessWidget {
  const SingleServiceScreen({super.key, required this.title});
  static const String routeName = '/single-srvice';
  final String title;
  void proceedToPay(BuildContext context) {
    SingleServiceState singleServiceState =
        BlocProvider.of<SingleServiceBloc>(context).state;
    if (singleServiceState.serviceType == 'Select Service Type') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Plese select service type before proceding!')));
      return;
    }
    Navigator.pushNamed(context, ScheduleAppoinmentScreen.routeName,
        arguments: {
          "serviceType": singleServiceState.serviceType,
          "noOfPeople": '${singleServiceState.noOfPeople}'
        });
  }

  @override
  Widget build(BuildContext context) {
    List<String> imageUrl = [
      'assets/images/haircut1.jpg',
      'assets/images/haircut2.jpg',
      'assets/images/haircut4.jpg',
    ];
    // double rating = 3;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopBigPicture(context: context),
              SizedBox(height: 10.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    ThreeDisplayPictures(imageUrl: imageUrl),
                    SizedBox(height: 20.h),
                    ServiceTitleAndRating(title: title),
                    SizedBox(height: 15.h),
                    const CustomExpansionTile(),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'CHOOSE DATE',
                              style: textTheme.bodySmall!
                                  .copyWith(color: Colors.black54),
                            ),
                            SizedBox(height: 10.h),
                            SizedBox(
                              height: 35.h,
                              width: 160,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                onPressed: () async {
                                  DateTime? selectedTime = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.now()
                                          .add(const Duration(days: 100)));
                                  if (selectedTime != null) {
                                    if (context.mounted) {
                                      BlocProvider.of<SingleServiceBloc>(
                                              context)
                                          .add(NewDateSelectedEvent(
                                              selectedDate: selectedTime));
                                    }
                                  }
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(
                                      Icons.calendar_today_rounded,
                                      size: 15,
                                    ),
                                    BlocBuilder<SingleServiceBloc,
                                        SingleServiceState>(
                                      builder: (context, state) {
                                        return Text(
                                          DateFormat('dd/MM/yyyy')
                                              .format(state.scheduledDate),
                                          style: textTheme.bodySmall!
                                              .copyWith(color: Colors.black),
                                        );
                                      },
                                    ),
                                    const Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: Colors.black,
                                      size: 15,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'CHOOSE PERSON',
                              style: textTheme.bodySmall!
                                  .copyWith(color: Colors.black54),
                            ),
                            SizedBox(height: 10.h),
                            SizedBox(
                              height: 35.h,
                              width: 160,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                onPressed: () {
                                  showChooseNoOfPersonDialog(context);
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(
                                      Icons.person_sharp,
                                      size: 15,
                                    ),
                                    BlocBuilder<SingleServiceBloc,
                                        SingleServiceState>(
                                      builder: (context, state) {
                                        return Text(
                                          '${state.noOfPeople} people',
                                          style: textTheme.bodySmall!
                                              .copyWith(color: Colors.black),
                                        );
                                      },
                                    ),
                                    // const Icon(
                                    //   Icons.keyboard_arrow_down_rounded,
                                    //   color: Colors.black,
                                    //   size: 15,
                                    // )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // SizedBox(height: 20.h),
                    ExpansionTile(
                      title: Text(
                        'Description',
                        style: textTheme.bodyLarge,
                      ),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Text(
                            'Some descrtption based on service',
                            style: textTheme.bodyLarge,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              BottomButtons(onTap: () => proceedToPay(context)),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> showChooseNoOfPersonDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => BlocBuilder<SingleServiceBloc, SingleServiceState>(
        builder: (context, state) {
          return Dialog(
            child: SizedBox(
              height: 135.h,
              width: 100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Select no of people',
                        style: textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.normal, fontSize: 19),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Center(
                      child: NumberPicker(
                        value: state.noOfPeople,
                        maxValue: 10,
                        axis: Axis.horizontal,
                        textStyle: textTheme.bodyLarge!.copyWith(fontSize: 19),
                        selectedTextStyle: textTheme.bodyLarge!
                            .copyWith(color: kPrimaryColor, fontSize: 22),
                        minValue: 1,
                        onChanged: (val) {
                          BlocProvider.of<SingleServiceBloc>(context)
                              .add(NoOfPeoplechanged(noOfPeople: val));
                        },
                      ),
                    ),
                    Align(
                      alignment: const Alignment(1, 0),
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Ok',
                            style: textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.normal, fontSize: 19),
                          )),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
