import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

// abstract class PickerState extends Equatable {
//   // @override
//   // List<Object?> get props => [];
// }

// class InitialState extends PickerState {}

class ImagePickerState extends Equatable {
  final XFile? file;
  const ImagePickerState({this.file});

  ImagePickerState copyWith({XFile? file}) {
    return ImagePickerState(file: file ?? this.file);
  }

  @override
  List<Object?> get props => [file];
}

class FilePickerState extends Equatable {
  final File? file;
  const FilePickerState({this.file});

  FilePickerState copyWith({File? file}) {
    return FilePickerState(file: file ?? this.file);
  }

  @override
  List<Object?> get props => [file];
}
