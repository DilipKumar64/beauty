import 'dart:async';
import 'dart:io';

import 'package:beauty/modals/single_service_model.dart';
import 'package:beauty/repositories/admin_pannel_repository.dart';
import 'package:beauty/screens/home/helper_component.dart';
import 'package:beauty/utils/custom_exception.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'admin_pannel_event.dart';
part 'admin_pannel_state.dart';

class AdminPannelBloc extends Bloc<AdminPannelEvent, AdminPannelState> {
  AdminPannelBloc() : super(AdminPannelInitial()) {
    on<SelectServiceLogoEvent>(onSelectServiceLogoEvent);
    on<AddPictureEvent>(onAddPictureEvent);
    on<AddServiceEvent>(onAddServiceEvent);
  }
  ImagePicker imagePicker = ImagePicker();
  AdminPannelRepository adminPannelRepository = AdminPannelRepository();
  FutureOr<void> onSelectServiceLogoEvent(
      SelectServiceLogoEvent event, Emitter<AdminPannelState> emit) async {
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    if (file == null) {
      emit(const AdminPannelErrorState(errorMessage: 'No photo selected'));
      return;
    }
    emit(state.copyWith(logoPath: File(file.path)));
  }

  FutureOr<void> onAddPictureEvent(
      AddPictureEvent event, Emitter<AdminPannelState> emit) async {
    XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      emit(const AdminPannelErrorState(errorMessage: 'No photo selected'));
      return;
    }
    List<File?> list = state.pathList.map((e) => e).toList();
    list.removeAt(event.index);
    list.insert(event.index, File(image.path));
    emit(state.copyWith(pathList: list));
  }

  FutureOr<void> onAddServiceEvent(
      AddServiceEvent event, Emitter<AdminPannelState> emit) async {
    String name = event.name.trim();
    String description = event.description.trim();

    try {
      if (state.logoPath == null) {
        throw CustomException(message: 'Please select a logo');
      }
      if (name.isEmpty) {
        throw CustomException(message: 'Please enter name');
      }
      if (description.isEmpty) {
        throw CustomException(message: 'Please enter description');
      }
      if (state.pathList.any((file) => file == null)) {
        throw CustomException(message: 'Please select 4 pictures');
      }
      List<String> downloadUrls = [];
      String? logoPath =
          await adminPannelRepository.uploadImageToFirebase(state.logoPath!);
      if (logoPath == null) {
        throw CustomException(message: 'Server error! failed to upload logo');
      }
      for (var a in state.pathList) {
        String? tempUrl = await adminPannelRepository.uploadImageToFirebase(a!);

        if (tempUrl != null) {
          downloadUrls.add(tempUrl);
        } else {
          throw CustomException(
              message: 'Server error failed to upload images');
        }
      }
      Map<String, dynamic> data = {
        "logoUrl": logoPath,
        "name": name,
        "description": description,
        "imagesList": downloadUrls
      };
      SingleServiceModal? serviceModal =
          await adminPannelRepository.uploadServicesDetails(data);
      print(serviceModal!.toJson());
    } catch (e) {
      if (e is CustomException) {
        HelperComponent.showSnackbar(event.context, e.message);
      } else {
        HelperComponent.showSnackbar(event.context, e.toString());
      }
    }
  }
}
