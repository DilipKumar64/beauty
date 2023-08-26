import 'package:beauty/constants.dart';
import 'package:beauty/screens/home/widgets/top_big_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleServiceScreen extends StatefulWidget {
  const SingleServiceScreen({super.key, required this.title});
  static const String routeName = '/single-srvice';
  final String title;
  @override
  State<SingleServiceScreen> createState() => _SingleServiceScreenState();
}

class _SingleServiceScreenState extends State<SingleServiceScreen> {
  double rating = 3;
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              TopBigPicture(context: context),
              SizedBox(height: 10.h),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 70.h,
                          width: 90.h,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage('assets/images/haircut1.jpg'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        Container(
                          height: 70.h,
                          width: 90.h,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage('assets/images/haircut2.jpg'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        Container(
                          height: 70.h,
                          width: 90.h,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage('assets/images/haircut4.jpg'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style: textTheme.labelLarge!
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Time: 1 hour',
                              style: textTheme.bodySmall!
                                  .copyWith(color: Colors.black54),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RatingBar.builder(
                              initialRating: rating,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemSize: 15.h,
                              itemCount: 5,
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: kPrimaryColor,
                              ),
                              onRatingUpdate: (newRating) {
                                rating = newRating;
                              },
                            ),
                            Text(
                              '1281 rating',
                              style: textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    SizedBox(
                      height: 40.h,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Select Service Type'),
                            Icon(Icons.keyboard_arrow_down_rounded)
                          ],
                        ),
                      ),
                    ),
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
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(
                                      Icons.calendar_today_rounded,
                                      size: 15,
                                    ),
                                    Text(
                                      '26/08/2023',
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
                                onPressed: () {},
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
              // SizedBox(height: 10.h),
              Container(
                padding: const EdgeInsets.all(16.0),
                height: 100.h,
                color: const Color(0xffe2f5fa),
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Container(
                        height: 53,
                        // width: size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: kPrimaryColor),
                        child: Center(
                          child: Text(
                            'Continue',
                            style: textTheme.titleMedium!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'Save for later',
                        style: textTheme.bodyMedium,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
