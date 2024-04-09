import 'dart:io';

import 'package:bloc_practice/features/image_picker/bloc/image_picker_event.dart';
import 'package:bloc_practice/features/image_picker/bloc/image_picker_state.dart';
import 'package:bloc_practice/helper/image_picker_utils.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  ImagePickerBloc() : super(const ImagePickerState()) {
    on<CameraImagePickEvent>(pickImageFromCamera);
    on<GallaryImagePickEvent>(pickImageFromGallary);
    // on<FilePickerEvent>(pickFile);
  }

  void pickImageFromCamera(
      CameraImagePickEvent event, Emitter<ImagePickerState> emit) async {
    XFile? file = await ImagePickerUtils.pickFromCamera();
    emit(ImagePickerState(file: file));
    // emit(state.copyWith(file: file));
  }

  void pickImageFromGallary(
      GallaryImagePickEvent event, Emitter<ImagePickerState> emit) async {
    XFile? file = await ImagePickerUtils.pickFromGallary();
    emit(ImagePickerState(file: file));
    // emit(state.copyWith(file: file));
  }

  void pickFile(FilePickerEvent event, Emitter<FilePickerState> emit) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
      emit(FilePickerState(file: file));
    } else {
      // User canceled the picker
    }
  }
}
