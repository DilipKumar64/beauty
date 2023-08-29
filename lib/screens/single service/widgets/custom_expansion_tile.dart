import 'package:beauty/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomExpansionTile extends StatefulWidget {
  const CustomExpansionTile({super.key});

  @override
  _CustomExpansionTileState createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool isExpanded = false;
  List<String> serviceTypeList = [
    'Basic - Rs.250',
    'Premium - Rs.449',
    'VIP - Rs.799'
  ];
  String initialValue = 'Select Service Type';
  int seletedIndex = 0;
  void _toggleExpand() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  void onNewItemSelected(int index) {
    setState(() {});
    seletedIndex = index;
    isExpanded = false;
    initialValue = serviceTypeList[index];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: kPrimaryColor),
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: _toggleExpand,
            child: SizedBox(
              height: 40.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    initialValue,
                    style: textTheme.bodyLarge!.copyWith(color: kPrimaryColor),
                  ),
                  SizedBox(width: 10.w),
                  RotationTransition(
                    turns: AlwaysStoppedAnimation(isExpanded ? 0.5 : 0),
                    child: const Icon(Icons.expand_more),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: isExpanded ? 110.h : 0,
            child: AnimatedCrossFade(
              duration: const Duration(milliseconds: 300),
              firstChild: Container(), // Placeholder for collapsed content
              secondChild: InkWell(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: SizedBox(
                    height: 110.h,
                    child: ListView.builder(
                        itemCount: serviceTypeList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () => onNewItemSelected(index),
                            child: Container(
                              color: (seletedIndex == index)
                                  ? kPrimaryColor
                                  : null,
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Center(
                                  child: Text(
                                    serviceTypeList[index],
                                    style: textTheme.bodyLarge!.copyWith(
                                        color: (seletedIndex == index)
                                            ? Colors.white
                                            : null),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  )),
              crossFadeState: isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
            ),
          ),
        ],
      ),
    );
  }
}