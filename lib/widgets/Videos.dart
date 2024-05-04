import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:app/screens/feedback_screen.dart';

// Function to request camera permission and record a video
Future<void> recordVideo(BuildContext context) async {
  // Check if camera permission is granted
  PermissionStatus cameraPermissionStatus = await Permission.camera.status;

  // If camera permission is not granted, request permission
  if (!cameraPermissionStatus.isGranted) {
    // Request camera permission
    PermissionStatus permissionStatus = await Permission.camera.request();

    // If permission is granted, proceed to record video
    if (permissionStatus.isGranted) {
      _startVideoRecording(context);
    } else {
      // Permission denied, show a message or handle accordingly
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Camera permission required to record videos.'),
        ),
      );
    }
  } else {
    // Camera permission already granted, proceed to record video
    _startVideoRecording(context);
  }
}

// Function to start video recording once permission is granted
void _startVideoRecording(BuildContext context) async {
  final picker = ImagePicker();

  try {
    XFile? videoFile = await picker.pickVideo(source: ImageSource.camera);

    if (videoFile != null) {
      // Navigate to feedback screen with the recorded video
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FeedbackScreen(videoURL: videoFile.path),
        ),
      );
    }
  } catch (e) {
    // Handle any errors that occur during video recording
    print('Error recording video: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error recording video. Please try again.'),
      ),
    );
  }
}

// Function to upload a video from the device's gallery
Future<String?> uploadVideo(BuildContext context) async {
  final picker = ImagePicker();

  try {
    // Pick a video from the device's gallery
    XFile? videoFile = await picker.pickVideo(source: ImageSource.gallery);

    if (videoFile != null) {
      // Perform upload logic here if needed

      // Return the file path of the selected video
      return videoFile.path;
    } else {
      // No video selected
      return null;
    }
  } catch (e) {
    // Handle any errors that occur during video selection/upload
    print('Error uploading video: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error uploading video. Please try again.'),
      ),
    );
    return null;
  }
}
