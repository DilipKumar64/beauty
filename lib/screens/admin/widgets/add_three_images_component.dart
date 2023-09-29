import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/admin_pannel_bloc.dart';

class AddThreeImagesComponent extends StatelessWidget {
  const AddThreeImagesComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: BlocBuilder<AdminPannelBloc, AdminPannelState>(
        builder: (context, state) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  context
                      .read<AdminPannelBloc>()
                      .add(AddPictureEvent(index: index + 1));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(10),
                    dashPattern: const [10, 4],
                    strokeCap: StrokeCap.round,
                    child: Container(
                      height: 70.h,
                      width: 85.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: (state.pathList[index + 1] == null)
                          ? Icon(
                              Icons.add_circle_outline_rounded,
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.5),
                              size: 40,
                            )
                          : Image.file(state.pathList[index + 1]!),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
