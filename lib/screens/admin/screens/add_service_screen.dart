import 'package:beauty/screens/auth/widgets/custom_text_field.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/admin_pannel_bloc.dart';
import '../widgets/add_big_picture_componen.dart';
import '../widgets/add_logo_component.dart';
import '../widgets/add_three_images_component.dart';

class AddServiceScreen extends StatelessWidget {
  const AddServiceScreen({super.key});
  static const String routeName = '/add-service';
  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add service'),
      ),
      body: BlocListener<AdminPannelBloc, AdminPannelState>(
        listener: (context, state) {
          if (state is AdminPannelErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24).copyWith(top: 8),
            child: Column(
              children: [
                const AddLogoComponent(),
                _gap(),
                Text(
                  'Select Service Logo',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.shade400,
                  ),
                ),
                _gap(),
                CustomTextField(
                    isPassword: false,
                    controller: titleController,
                    hintText: 'Service name'),
                _gap(),
                CustomTextField(
                    isPassword: false,
                    controller: descriptionController,
                    hintText: 'Service descripton',
                    maxLines: 5),
                _gap(),
                const Align(
                  alignment: Alignment(-1, 0),
                  child: Text(
                    'Pictures',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                _gap(),
                const AddBigPictureComponent(),
                _gap(),
                const AddThreeImagesComponent(),
                _gap(),
                _addServiceButton(
                    context, titleController, descriptionController),
                _gap(),
                _gap(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _addServiceButton(BuildContext context, TextEditingController name,
      TextEditingController description) {
    return SizedBox(
      width: double.infinity,
      height: 40.h,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: () {
          context.read<AdminPannelBloc>().add(
              AddServiceEvent(name: name.text, description: description.text));
        },
        child: Text(
          'Add service',
          style: TextStyle(fontSize: 20.sp),
        ),
      ),
    );
  }

  SizedBox _gap() => SizedBox(height: 10.h);
}
