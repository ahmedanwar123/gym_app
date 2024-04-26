import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:app/shared/theme.dart';
import 'package:app/screens/feedback_screen.dart';

class BicepCurl_Popup extends StatelessWidget {
  const BicepCurl_Popup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context); // Navigate back when background is tapped
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            height: 400,
            width: 325,
            decoration: BoxDecoration(
              color: Colors.grey[800]?.withOpacity(0.8),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/WorkoutCategories_BicepsCurl.png',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                      Positioned(
                        bottom: 20.0,
                        left: 20.0,
                        child: Text(
                          'Dumbbell Biceps Curl',
                          style: TextStyle(
                            color: textColor,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                blurRadius: 2.0,
                                color: Colors.black,
                                offset: Offset(2.0, 2.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          RecordVideo(context);
                        },
                        icon: Icon(Icons.play_arrow),
                        label: Text("Live"),
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                          backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 12, horizontal: 98)),
                          shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          )),
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () async {
                          String? uploadedVideoURL = await uploadVideo(context);
                          if (uploadedVideoURL != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FeedbackScreen(videoURL: uploadedVideoURL),
                              ),
                            );
                          }
                        },
                        label: Text("Upload"),
                        icon: Icon(Icons.video_library_outlined),
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                          backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 12, horizontal: 90)),
                          shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          )),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancel"),
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(textColor),
                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 12, horizontal: 24)),
                          shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<XFile?> PickVideo() async {
  final picker = ImagePicker();
  try {
    XFile? videoFile = await picker.pickVideo(source: ImageSource.gallery);
    return videoFile;
  } catch (e) {
    print('Error picking video: $e');
    return null;
  }
}

void RecordVideo(BuildContext context) async {
  final picker = ImagePicker();
  try {
    XFile? videoFile = await picker.pickVideo(source: ImageSource.camera);
    if (videoFile != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FeedbackScreen(videoURL: videoFile.path),
        ),
      );
    }
  } catch (e) {
    print('Error recording video: $e');
  }
}

Future<String?> uploadVideo(BuildContext context) async {
  final picker = ImagePicker();

  try {
    // Pick video from gallery
    XFile? videoFile = await picker.pickVideo(source: ImageSource.gallery);

    if (videoFile != null) {
      // Perform your upload logic here if needed

      // Return the file path of the selected video
      return videoFile.path;
    } else {
      // No video selected
      return null;
    }
  } catch (e) {
    // Error occurred during picking/uploading video
    print('Error uploading video: $e');
    return null;
  }
}
