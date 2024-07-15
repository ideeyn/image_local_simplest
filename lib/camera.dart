import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });

      // Save image to local storage (optional)
      final appDirectory = await getApplicationDocumentsDirectory();
      final imagePath = '${appDirectory.path}/captured_image.jpg';
      // final imagePath = '${appDirectory.path}/second.jpg';
      await _image!.copy(imagePath);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Camera')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image != null
                ? Image.file(_image!)
                : const Text('No image captured'),
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Capture Image'),
            ),
          ],
        ),
      ),
    );
  }
}
