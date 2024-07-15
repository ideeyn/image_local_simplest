import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  File? _image;
  String tesPath = '';

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    final appDirectory = await getApplicationDocumentsDirectory();
    setState(() => tesPath = appDirectory.path);
    //
    // final imagePath = '${appDirectory.path}/captured_image.jpg';
    final imagePath = '${appDirectory.path}/second.jpg';
    final file = File(imagePath);
    if (file.existsSync()) {
      _image = file;
      setState(() {});
    }
  }

  Future<void> _deleteImage() async {
    if (_image != null) {
      await _image!.delete();
      setState(() {
        _image = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_image != null) Image.file(_image!),
            if (_image == null) const Text('no image found'),
            Text(tesPath),
            if (_image != null)
              ElevatedButton(
                onPressed: _deleteImage,
                child: const Text('Delete Image'),
              ),
          ],
        ),
      ),
    );
  }
}
