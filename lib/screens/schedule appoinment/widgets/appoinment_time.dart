import 'package:beauty/bloc/schedule%20appoinment/schedule_appoinment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants.dart';

class AppoinmentTme extends StatefulWidget {
  const AppoinmentTme({
    super.key,
    required this.list,
    required this.listId,
    required this.selectedListId,
  });
  final List<String> list;
  final int listId;
  final int selectedListId;

  @override
  State<AppoinmentTme> createState() => _AppoinmentTmeState();
}

class _AppoinmentTmeState extends State<AppoinmentTme> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 5,
          mainAxisExtent: 45.h,
        ),
        itemCount: widget.list.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              BlocProvider.of<ScheduleAppoinmentBloc>(context).add(
                  ScheduleAppoinmentTimeUpdatedEvent(
                      index: index, listId: widget.listId));
              setState(() {
                selectedIndex = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: (widget.selectedListId == widget.listId &&
                            selectedIndex == index)
                        ? kPrimaryColor
                        : null,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                    child: Text(
                  widget.list[index],
                  style: textTheme.bodyMedium!.copyWith(
                      color: (widget.selectedListId == widget.listId &&
                              selectedIndex == index)
                          ? Colors.white
                          : kPrimaryColor),
                )),
              ),
            ),
          );
        });
  }
}
