import 'package:flutter/material.dart';
import 'package:image_local_simplest/camera.dart';
import 'package:image_local_simplest/gallery.dart';

void main() {
  runApp(const MaterialApp(home: IndexPage()));
}

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Index')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (c) => const CameraScreen()),
                );
              },
              child: const Text('Capture Image'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (c) => const GalleryScreen()),
                );
              },
              child: const Text('View Image'),
            ),
          ],
        ),
      ),
    );
  }
}
