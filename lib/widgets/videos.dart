
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

// Function to request camera permission and record a video
Future<String?> recordVideo(BuildContext context,
    {required String excerciseName}) async {
  PermissionStatus cameraPermissionStatus = await Permission.camera.status;
  final picker = ImagePicker();

  if (!cameraPermissionStatus.isGranted) {
    PermissionStatus permissionStatus = await Permission.camera.request();

    if (permissionStatus.isGranted) {
      try {
        XFile? videoFile = await picker.pickVideo(source: ImageSource.camera);

        if (videoFile != null) {
          print(excerciseName);
          print(videoFile.path);

          // Decode the file path
          String decodedFilePath = Uri.decodeFull(videoFile.path);

          // Create FormData object
          var request = http.MultipartRequest(
            'POST',
            Uri.parse(
                'http://192.168.110.52:3000/video-processing'), // Change the URL to the endpoint
          );
          request.fields['excercise_name'] = excerciseName;
          request.files.add(
            await http.MultipartFile.fromPath(
              'video',
              decodedFilePath, // Use the decoded file path
              contentType: MediaType('video', 'mp4'),
            ),
          );

          // Send data to the server using http
          var streamedResponse = await request.send();
          var response = await http.Response.fromStream(streamedResponse);

          if (response.statusCode == 200) {
            // Request successful
            print("Video recorded successfully") ;
            return videoFile.path;
          } else {
            // Request failed
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Failed to upload video. Please try again.'),
              ),
            );
            print("failed") ;
            return null;
          }
        } else {
          print("failed") ;
          return null;

        }
      } catch (e) {
        print('Error recording video: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error recording video. Please try again.'),
          ),
        );
        print("failed") ;
        return null; // Return null after showing the error message
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Camera permission required to record videos.'),
        ),
      );
      print("failed") ;
      return null; // Return null if permission is denied
    }
  } else {
    try {
      XFile? videoFile = await picker.pickVideo(source: ImageSource.camera);

      if (videoFile != null) {
        print(excerciseName);
        print(videoFile.path);

        // Decode the file path
        String decodedFilePath = Uri.decodeFull(videoFile.path);

        // Create FormData object
        var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              'http://192.168.110.52:3000/video-processing'), // Change the URL to the endpoint
        );
        request.fields['excercise_name'] = excerciseName;
        request.files.add(
          await http.MultipartFile.fromPath(
            'video',
            decodedFilePath, // Use the decoded file path
            contentType: MediaType('video', 'mp4'),
          ),
        );

        // Send data to the server using http
        var streamedResponse = await request.send();
        var response = await http.Response.fromStream(streamedResponse);

        if (response.statusCode == 200) {
          // Request successful
          print("Video recorded successfully") ;
          return videoFile.path;
        } else {
          // Request failed
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to upload video. Please try again.'),
            ),
          );
          print("failed") ;
          return null;
        }
      } else {
        print("failed") ;
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
Future<String?> uploadVideo(BuildContext context,
    {required String exerciseName}) async {
  final picker = ImagePicker();

  try {
    // Pick a video from the device's gallery
    XFile? videoFile = await picker.pickVideo(source: ImageSource.gallery);

    if (videoFile != null) {
      print(exerciseName);
      print(videoFile.path);

      // Decode the file path
      String decodedFilePath = Uri.decodeFull(videoFile.path);

      // Create FormData object
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'http://192.168.110.52:3000/video-processing'), // Change the URL to the endpoint
      );
      request.fields['excercise_name'] = exerciseName;
      request.files.add(
        await http.MultipartFile.fromPath(
          'video',
          decodedFilePath, // Use the decoded file path
          contentType: MediaType('video', 'mp4'),
        ),
      );

      // Send data to the server using http
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        // Request successful
        print("Video recorded successfully") ;
        return videoFile.path;
      } else {
        print("failed") ;
        // Request failed
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to upload video. Please try again.'),
          ),
        );
        return null;
      }
    } else {
      // No video selected
      print("failed") ;
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
