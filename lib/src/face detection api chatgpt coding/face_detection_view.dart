import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

import 'camera_view.dart';
import 'face_detection_details.dart';

class FaceDetectionView extends StatefulWidget {
  const FaceDetectionView({
    super.key,
    this.title = 'Face Detection'
  });

  final String title;

  static const routeName = '/facedetection';

  @override
  State<FaceDetectionView> createState() => _FaceDetectionViewState();
}

class _FaceDetectionViewState extends State<FaceDetectionView> {
  // Create the face detector object
  final FaceDetector _faceDetector = FaceDetector(
    options: FaceDetectorOptions(
      enableContours: true,
      enableClassification: true,
    ),
  );
  bool _canProcess = true;
  bool _isBusy = false;
  CustomPaint? _customPaint;
  String? _text;

  Future<void> processImage(final InputImage inputImage) async {
    if (!_canProcess) return;
    if (_isBusy) return;
    _isBusy = true;
    setState(() {
      _text = "";
    });
    final faces = await _faceDetector.processImage(inputImage);
    if (inputImage.inputImageData?.size != null &&
        inputImage.inputImageData?.imageRotation != null) {
      final painter = FaceDetectorPainter(
        faces,
        inputImage.inputImageData!.size,
        inputImage.inputImageData!.imageRotation
      );
      _customPaint = CustomPaint(painter: painter);
    } else {
      String text = 'face found ${faces.length}\n\n';
      for (final face in faces) {
        text += 'face ${face.boundingBox}\n\n';
      }
      _text = text;
      _customPaint = null;
      log(text);
    }
    _isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _canProcess = false;
    _faceDetector.close();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return CameraView(
      title: 'Face Detector',
      customPaint: _customPaint,
      text: _text,
      onImage: (inputImage) {
        processImage(inputImage);
      },
      initialDirection: CameraLensDirection.front,
    );
  }
}