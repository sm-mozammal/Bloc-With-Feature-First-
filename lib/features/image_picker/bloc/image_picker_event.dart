import 'package:equatable/equatable.dart';

abstract class ImagePickerEvent extends Equatable {
  const ImagePickerEvent();

  @override
  List<Object?> get props => [];
}

class GallaryImagePickEvent extends ImagePickerEvent {}

class CameraImagePickEvent extends ImagePickerEvent {}

class FilePickerEvent extends ImagePickerEvent {}
