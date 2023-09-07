import 'package:beauty/constants.dart';
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
                    CustomExpansionTile(),
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
                                    BlocProvider.of<SingleServiceBloc>(context)
                                        .add(NewDateSelectedEvent(
                                            selectedDate: selectedTime));
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
                                  showDialog(
                                      context: context,
                                      builder: (context) => Dialog(
                                              child: Container(
                                            color: Colors.amber,
                                            height: 40,
                                            width: 30,
                                            child: NumberPicker(
                                                itemHeight: 40,
                                                itemWidth: 40,
                                                minValue: 1,
                                                maxValue: 10,
                                                value: 3,
                                                onChanged: (value) {}),
                                          )));
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(
                                      Icons.person_sharp,
                                      size: 15,
                                    ),
                                    Text(
                                      '2 people',
                                      style: textTheme.bodySmall!
                                          .copyWith(color: Colors.black),
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
              BottomButtons(onTap: () {
                Navigator.pushNamed(context, ScheduleAppoinmentScreen.routeName,
                    arguments: {
                      "serviceType": "Basic - Rs 250",
                      "noOfPeople": '2'
                    });
              }),
            ],
          ),
        ),
      ),
    );
  }
}
