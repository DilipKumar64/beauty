import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/admin_pannel_bloc.dart';

class AddBigPictureComponent extends StatelessWidget {
  const AddBigPictureComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<AdminPannelBloc>().add(const AddPictureEvent(index: 0));
      },
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(10),
        dashPattern: const [10, 4],
        strokeCap: StrokeCap.round,
        child: Container(
          height: 250.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: BlocBuilder<AdminPannelBloc, AdminPannelState>(
            builder: (context, state) {
              return (state.pathList[0] == null)
                  ? Icon(
                      Icons.add_circle_outline_rounded,
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                      size: 40,
                    )
                  : Image.file(state.pathList[0]!);
            },
          ),
        ),
      ),
    );
  }
}
