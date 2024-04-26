import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../shared/theme.dart';
import '../widgets/expandableBox_Widget.dart';
import '../screens/workout_categories_page.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key, required this.videoURL}) : super(key: key);
  final String videoURL;
  // You can add more parameters if needed, like WorkoutName

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  late VideoPlayerController _controller;
  double _volumeLevel = 1.0;
  double _playbackSpeed = 1.0;
  double videoContainerRatio = 0.5; // Adjust this value as needed

  final List<String> exerciseFeedback = [
    '1. Form & Technique',
    '2. Stability',
    '3. Motion & Control'
  ];
  bool _isExpanded1 = false;
  bool _isExpanded2 = false;
  bool _isExpanded3 = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.videoURL))
      ..initialize().then((_) {
        setState(() {});
      })
      ..setLooping(true); // Loop the video indefinitely
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _togglePlayPause() {
    if (_controller.value.isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }
  }

  void _jumpBackward() {
    final newPosition = _controller.value.position - Duration(seconds: 10);
    if (newPosition.inSeconds < 0) {
      _controller.seekTo(Duration.zero);
    } else {
      _controller.seekTo(newPosition);
    }
  }

  void _jumpForward() {
    final newPosition = _controller.value.position + Duration(seconds: 10);
    if (newPosition > _controller.value.duration) {
      _controller.seekTo(_controller.value.duration);
    } else {
      _controller.seekTo(newPosition);
    }
  }

  void _changeVolume(double delta) {
    setState(() {
      _volumeLevel = (_volumeLevel + delta).clamp(0.0, 1.0);
    });
    _controller.setVolume(_volumeLevel);
  }

  void _changePlaybackSpeed(double delta) {
    setState(() {
      _playbackSpeed = (_playbackSpeed + delta).clamp(0.5, 2.0);
    });
    _controller.setPlaybackSpeed(_playbackSpeed);
  }

  double getScale() {
    double videoRatio = _controller.value.aspectRatio;

    if (videoRatio < videoContainerRatio) {
      // For tall videos, return the inverse of the controller aspect ratio
      return videoContainerRatio / videoRatio;
    } else {
      // For wide videos, divide the video AR by the fixed container AR
      // so that the video does not over scale
      return videoRatio / videoContainerRatio;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Define breakpoints for your media queries
    final isSmallScreen = screenWidth < 600;
    final isMediumScreen = screenWidth >= 600 && screenWidth < 1024;
    final isLargeScreen = screenWidth >= 1024;

    return Scaffold(
      backgroundColor: bgColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: screenHeight * videoContainerRatio,
            flexibleSpace: FlexibleSpaceBar(
              background: AspectRatio(
                aspectRatio: _controller.value.aspectRatio * getScale(),
                child: VideoPlayer(_controller),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 10 : 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => _changeVolume(-0.1),
                          icon: Icon(Icons.volume_down),
                          iconSize: isSmallScreen ? 24 : 32,
                          color: Colors.white,
                        ),
                        IconButton(
                          onPressed: _jumpBackward,
                          icon: Icon(Icons.skip_previous),
                          iconSize: isSmallScreen ? 24 : 32,
                          color: Colors.white,
                        ),
                        IconButton(
                          onPressed: _togglePlayPause,
                          icon: Icon(
                            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                          ),
                          iconSize: isSmallScreen ? 24 : 32,
                          color: Colors.white,
                        ),
                        IconButton(
                          onPressed: _jumpForward,
                          icon: Icon(Icons.skip_next),
                          iconSize: isSmallScreen ? 24 : 32,
                          color: Colors.white,
                        ),
                        IconButton(
                          onPressed: () => _changeVolume(0.1),
                          icon: Icon(Icons.volume_up),
                          iconSize: isSmallScreen ? 24 : 32,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(isSmallScreen ? 5 : 10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: isSmallScreen ? 3 : 5,
                          blurRadius: isSmallScreen ? 5 : 7,
                          offset: Offset(0, isSmallScreen ? 2 : 3),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: isSmallScreen
                      ? screenHeight * 0.2
                      : (_isExpanded1 ? screenHeight * 0.4 : screenHeight * 0.21),
                  child: ExpandableBox(
                    label: exerciseFeedback[0],
                    isExpanded: _isExpanded1,
                    feedback: "",
                    onToggle: () => setState(() {
                      _isExpanded1 = !_isExpanded1;
                    }),
                  ),
                ),
                SizedBox(
                  height: isSmallScreen ? 10 : 20,
                ),
                SizedBox(
                  height: isSmallScreen
                      ? screenHeight * 0.2
                      : (_isExpanded2 ? screenHeight * 0.4 : screenHeight * 0.21),
                  child: ExpandableBox(
                    label: exerciseFeedback[1],
                    isExpanded: _isExpanded2,
                    feedback: "Feedback for item B",
                    onToggle: () => setState(() {
                      _isExpanded2 = !_isExpanded2;
                    }),
                  ),
                ),
                SizedBox(
                  height: isSmallScreen ? 10 : 20,
                ),
                SizedBox(
                  height: isSmallScreen
                      ? screenHeight * 0.2
                      : (_isExpanded3 ? screenHeight * 0.4 : screenHeight * 0.21),
                  child: ExpandableBox(
                    label: exerciseFeedback[2],
                    isExpanded: _isExpanded3,
                    feedback: "Feedback for item C",
                    onToggle: () => setState(() {
                      _isExpanded3 = !_isExpanded3;
                    }),
                  ),
                ),
                SizedBox(height: isSmallScreen ? 6.0 : 12.0,),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Video URL: ${widget.videoURL}");
        },
        child: Icon(Icons.info),
      ),
    );
  }
}
