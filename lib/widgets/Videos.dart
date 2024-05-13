
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';


// Function to request camera permission and record a video
Future<String?> recordVideo(BuildContext context) async {
  PermissionStatus cameraPermissionStatus = await Permission.camera.status;
  final picker = ImagePicker();

  if (!cameraPermissionStatus.isGranted) {
    PermissionStatus permissionStatus = await Permission.camera.request();

    if (permissionStatus.isGranted) {
      try {
        XFile? videoFile = await picker.pickVideo(source: ImageSource.camera);

        if (videoFile != null) {
          return videoFile.path;
        } else {
          return null;
        }
      } catch (e) {
        print('Error recording video: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error recording video. Please try again.'),
          ),
        );
        return null; // Return null after showing the error message
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Camera permission required to record videos.'),
        ),
      );
      return null; // Return null if permission is denied
    }
  } else {
    try {
      XFile? videoFile = await picker.pickVideo(source: ImageSource.camera);

      if (videoFile != null) {
        return videoFile.path;
      } else {
        return null;
      }
    } catch (e) {
      print('Error recording video: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error recording video. Please try again.'),
        ),
      );
      return null; // Return null after showing the error message
    }
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
