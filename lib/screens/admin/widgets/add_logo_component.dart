import 'package:beauty/screens/admin/bloc/admin_pannel_bloc.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class AddLogoComponent extends StatelessWidget {
  const AddLogoComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<AdminPannelBloc>().add(SelectServiceLogoEvent());
      },
      child: BlocBuilder<AdminPannelBloc, AdminPannelState>(
        builder: (context, state) {
          return DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(10),
            dashPattern: const [10, 4],
            strokeCap: StrokeCap.round,
            child: Container(
              width: 80.w,
              height: 60.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: (state.logoPath == null)
                  ? Icon(
                      Icons.add_circle_outline_rounded,
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                      size: 40,
                    )
                  : Image.file(
                      state.logoPath!,
                      fit: BoxFit.fitHeight,
                    ),
            ),
          );
        },
      ),
    );
  }
}
