import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../utils/constants.dart';
import '../bloc/notification_bloc.dart';

class AppoinmentDeatialComponent extends StatefulWidget {
  const AppoinmentDeatialComponent({super.key});

  @override
  State<AppoinmentDeatialComponent> createState() =>
      _AppoinmentDeatialComponentState();
}

class _AppoinmentDeatialComponentState
    extends State<AppoinmentDeatialComponent> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<NotificationBloc, NotificationState>(
      builder: (context, state) {
        final appoinment = state.appoinment;
        return (appoinment == null)
            ? Center(
                child: Stack(
                  children: [
                    Image.asset('assets/images/empty.png'),
                    Positioned(
                        right: size.width * .25,
                        bottom: 3,
                        child: Text(
                          "Nothing to show",
                          style: textTheme.bodyLarge!.copyWith(
                            fontSize: 18,
                            color: const Color.fromARGB(255, 145, 142, 142),
                          ),
                        ))
                  ],
                ),
              )
            : Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(179, 158, 158, 158),
                        width: 2),
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        isExpanded = !isExpanded;
                        setState(() {});
                      },
                      child: SizedBox(
                        height: 40.h,
                        child: Row(
                          children: [
                            Text(
                              'Appoinment time: ',
                              style: textTheme.bodyLarge!.copyWith(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              maxLines: 1,
                              DateFormat('E, MMM d, hh:mm')
                                  .format(appoinment.appoinmentTime),
                              style: textTheme.bodyLarge!.copyWith(
                                  color: kPrimaryColor,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            SizedBox(width: 10.w),
                            RotationTransition(
                              turns:
                                  AlwaysStoppedAnimation(isExpanded ? 0.5 : 0),
                              child: const Icon(Icons.expand_more),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: isExpanded ? 95.h : 0,
                      child: AnimatedCrossFade(
                        duration: const Duration(milliseconds: 300),
                        firstChild:
                            Container(), // Placeholder for collapsed content
                        secondChild: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'No of people:',
                                    style: textTheme.bodyLarge!.copyWith(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    appoinment.noOfPeople,
                                    style: textTheme.bodyLarge!.copyWith(
                                        color: kPrimaryColor,
                                        overflow: TextOverflow.ellipsis),
                                  )
                                ],
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Service Type:',
                                    style: textTheme.bodyLarge!.copyWith(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    appoinment.serviceType,
                                    style: textTheme.bodyLarge!.copyWith(
                                        color: kPrimaryColor,
                                        overflow: TextOverflow.ellipsis),
                                  )
                                ],
                              ),
                              const Divider(thickness: 1),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: size.width * .30,
                                    child: Text(
                                      'Total price',
                                      style: textTheme.bodyLarge!.copyWith(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    appoinment.totalPrice,
                                    style: textTheme.bodyLarge!.copyWith(
                                        color: kPrimaryColor,
                                        overflow: TextOverflow.ellipsis),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        crossFadeState: isExpanded
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
