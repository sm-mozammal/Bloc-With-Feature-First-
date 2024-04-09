import 'dart:io';

import 'package:bloc_practice/features/image_picker/bloc/image_picker_bloc.dart';
import 'package:bloc_practice/features/image_picker/bloc/image_picker_event.dart';
import 'package:bloc_practice/features/image_picker/bloc/image_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../gen/assets.gen.dart';

class ImagePickerScreen extends StatelessWidget {
  const ImagePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Image Picker'),
        ),
        body: BlocBuilder<ImagePickerBloc, ImagePickerState>(
          builder: (context, state) {
            return ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const Text('Image Showing'),
                (state.file == null)
                    ? Image.asset(Assets.images.image.path)
                    : Image.file(File(state.file!.path.toString())),
                ElevatedButton(
                    onPressed: () {
                      context
                          .read<ImagePickerBloc>()
                          .add((CameraImagePickEvent()));
                    },
                    child: const Text('Pick Image From Camera')),
                ElevatedButton(
                    onPressed: () {
                      context
                          .read<ImagePickerBloc>()
                          .add((GallaryImagePickEvent()));
                    },
                    child: const Text('Pick Image From Gallary'))
              ],
            );
          },
        ));
  }
}
