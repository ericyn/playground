

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:playground/src/image%20colour%20extractor%202000/image_colour_extract.dart';

class CameraView extends StatefulWidget {
  const CameraView({
    super.key,
    this.title = "Camera View",
  });

  final String title;

  static const routeName = '/cameraview';

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  // This is the file that will be used to store the image
  File? _image;

  //final XFile? photo = await picker.pickImage(source: ImageSource.camera);

  // This is the image picker
  final _picker = ImagePicker();
  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  Future<void> _openCameraPicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            MaterialButton(
              color: Colors.blue,
              child: const Text(
                  "Pick Image from Gallery",
                style: TextStyle(
                  color: Colors.white70, fontWeight: FontWeight.bold
                )
              ),
              onPressed: () {
                _openImagePicker();
              }
            ),
            MaterialButton(
              color: Colors.blue,
              child: const Text(
                  "Pick Image from Camera",
                  style: TextStyle(
                      color: Colors.white70, fontWeight: FontWeight.bold
                  )
              ),
              onPressed: () {
                _openCameraPicker();
              }
            ),
            const SizedBox(height: 35),
            // The picked image will be displayed here
            Container(
              margin: const EdgeInsets.all(20),
              child: ImageExtractor(
                imagePath: _image!
              ),
            ),
            
          ],
        ),
      )
    );
  }
}