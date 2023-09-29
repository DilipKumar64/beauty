import 'dart:async';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
      AddServiceEvent event, Emitter<AdminPannelState> emit) {
    String name = event.name.trim();
    String description = event.description.trim();

    if (state.logoPath == null) {
      emit(const AdminPannelErrorState(errorMessage: 'Please select a logo'));
    } else if (state.pathList.length < 4) {
      emit(const AdminPannelErrorState(errorMessage: 'Please select pictures'));
    } else if (name.isEmpty) {
      emit(const AdminPannelErrorState(errorMessage: 'Please enter name'));
    } else if (description.isEmpty) {
      emit(const AdminPannelErrorState(
          errorMessage: 'Please enter description'));
    } else {
      Map<String, dynamic> data = {};
    }
  }
}
