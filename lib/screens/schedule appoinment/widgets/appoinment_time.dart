import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants.dart';
import '../bloc/schedule_appoinment_bloc.dart';

class AppoinmentTme extends StatelessWidget {
  const AppoinmentTme({
    super.key,
    required this.list,
    required this.listId,
    required this.selectedListId,
    required this.selectedIndex,
    required this.state,
  });
  final List<String> list;
  final int listId;
  final int selectedListId;
  final int selectedIndex;
  final ScheduleAppoinmentState state;

  // int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 5,
          mainAxisExtent: 45.h,
        ),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return BlocBuilder<ScheduleAppoinmentBloc, ScheduleAppoinmentState>(
            builder: (context, state) {
              return InkWell(
                onTap: () {
                  BlocProvider.of<ScheduleAppoinmentBloc>(context).add(
                      ScheduleAppoinmentUpdatedEvent(
                          selectedIndex: index, selectedListId: listId));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: (state.selectedListId == listId &&
                                state.selectedIndex == index)
                            ? kPrimaryColor
                            : null,
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        list[index],
                        style: textTheme.bodyMedium!.copyWith(
                            color: (listId == selectedListId &&
                                    selectedIndex == index)
                                ? Colors.white
                                : kPrimaryColor),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        });
  }
}
