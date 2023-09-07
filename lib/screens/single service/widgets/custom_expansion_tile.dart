import 'package:beauty/constants.dart';
import 'package:beauty/screens/single%20service/bloc/single_service_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomExpansionTile extends StatelessWidget {
  CustomExpansionTile({super.key});

  // bool isExpanded = false;

  List<String> serviceTypeList = [
    'Basic - Rs.250',
    'Premium - Rs.449',
    'VIP - Rs.799'
  ];

  String initialValue = 'Select Service Type';

  int seletedIndex = 0;
  void _toggleExpand(BuildContext context, bool isExpanded) {
    BlocProvider.of<SingleServiceBloc>(context)
        .add(SelectServiceTypeToggled(isExpanded: isExpanded));
  }

  void onNewItemSelected(BuildContext context, int index, bool isExpanded) {
    BlocProvider.of<SingleServiceBloc>(context)
        .add(SelectServiceTypeToggled(isExpanded: isExpanded));
    BlocProvider.of<SingleServiceBloc>(context).add(TypeOfServiceUpdated(
        typeOfService: serviceTypeList[index], index: index));
    // setState(() {});
    // seletedIndex = index;
    // isExpanded = false;
    // initialValue = serviceTypeList[index];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SingleServiceBloc, SingleServiceState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
              border: Border.all(color: kPrimaryColor),
              borderRadius: BorderRadius.circular(5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => _toggleExpand(context, state.isExpanded),
                child: SizedBox(
                  height: 40.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        state.serviceType,
                        style:
                            textTheme.bodyLarge!.copyWith(color: kPrimaryColor),
                      ),
                      SizedBox(width: 10.w),
                      RotationTransition(
                        turns:
                            AlwaysStoppedAnimation(state.isExpanded ? 0.5 : 0),
                        child: const Icon(Icons.expand_more),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: state.isExpanded ? 110.h : 0,
                child: AnimatedCrossFade(
                  duration: const Duration(milliseconds: 300),
                  firstChild: Container(), // Placeholder for collapsed content
                  secondChild: InkWell(
                      onTap: () {
                        // setState(() {
                        //   isExpanded = !isExpanded;
                        // });
                      },
                      child: SizedBox(
                        height: 110.h,
                        child: ListView.builder(
                            itemCount: serviceTypeList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () => onNewItemSelected(
                                    context, index, state.isExpanded),
                                child: Container(
                                  color: (state.selectedIndex == index)
                                      ? kPrimaryColor
                                      : null,
                                  child: Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: Center(
                                      child: Text(
                                        serviceTypeList[index],
                                        style: textTheme.bodyLarge!.copyWith(
                                            color:
                                                (state.selectedIndex == index)
                                                    ? Colors.white
                                                    : null),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      )),
                  crossFadeState: state.isExpanded
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
