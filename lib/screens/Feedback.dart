import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../shared/theme.dart';
import '../widgets/expandableBox_Widget.dart';
import 'workout_categories_page.dart';
import 'cyclesFeedback.dart';
import 'cf1.dart';

class Feedbacks extends StatefulWidget {

  const Feedbacks({Key? key, required this.Workoutlevel,required this.videoURL, required this.exerciseName}) : super(key: key);
  final String videoURL;
  final String Workoutlevel;
  final String exerciseName;

  @override
  State<Feedbacks> createState() => _FeedbackState();
}

class _FeedbackState extends State<Feedbacks> {
  late VideoPlayerController _controller;
  double _volumeLevel = 1.0;
  double videoContainerRatio = 0.5;
  late List<bool> isExpanded = [false, false, false];
  late int x = 0;
  late int y = 0;

  final List<String> bicepexerciseFeedback = [
    'Tips for bicep Form & Technique',
    'Tips for bicep Stability',
    'Tips for bicep Motion & Control'
  ];
  final List<String> lateralexerciseFeedback = [
    'Tips for lateral raise Form & Technique',
    'Tips for lateral raise Stability',
    'Tips for lateral raise Motion & Control'
  ];

  bool ex( String exerciseName) {
    bool ex;

    if ( exerciseName == 'bicep') {
      ex = true;
    } else  {
      ex = false;
    }
    return ex;
  }
  final List<String> bicepfeedbackPoints = [
    '- Ensure an upright posture',
    '- Elbows should be close to your torso',
    '- Elbows shouldn\'t be far way',
    '- Minimize the swinging',
    '-Shoulders should remain stable throughout the exercise',
    '-Stand Still while lifting the dumbells ',
    '-The dumbbells should be lifted with a full range of motion',
    '-Avoid Hyperextension of your elbow joint',
    '-Avoid rapid motions',
  ];
  final List<String> lateralfeedbackpoints = [
    'Ensure maintaining an upright posture with shoulders back and chest up.',
    'Ensure raising the dumbbells directly to your sides, keeping your arms straight or slightly bent at elbows.',
    'Ensure holding dumbbells with a natural grip with palms facing the thighs.',
    'Ensure minimizing swinging while lifting the dumbbells.',
    'Ensure shoulders should remain stable throughout the exercise.',
    'Ensure stand still while lifting the dumbbells.',
    'Ensure raising the dumbbells until parallel to the ground or slightly below shoulder height.',
    'Ensure controlling the movement tempo and avoiding rapid motions.',
    'Ensure avoiding hyperextension of elbow joints & excessive elevation or protraction of shoulder blades.',
  ];


  @override
  void initState() {
    super.initState();
    isExpanded = List.generate(3, (index) => false);
    _initVideoPlayer();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _initVideoPlayer() async {
    try {
      if (File(widget.videoURL).existsSync()) {
        _controller = VideoPlayerController.file(File(widget.videoURL));
        await _controller.initialize();
        setState(() {});
        _controller.setLooping(true);
      } else {
        // Handle case where video file doesn't exist
        print("Video file doesn't exist.");
      }
    } catch (error) {
      print("Error initializing video player: $error");
      // Handle error appropriately (e.g., show error message to user)
    }
  }


  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight:
                MediaQuery.of(context).size.height * videoContainerRatio,
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
                  child: _buildControlBar(),
                ),
                const SizedBox(height: 5.0),
                for (int i = 0; i < 3; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 0.0,
                      horizontal: 4.0,
                    ),
                    child: _buildExpandableBox(i),
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CF1(Workoutlevel: widget.Workoutlevel, exerciseName: widget.exerciseName,)));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                    ),
                    child: Text(
                      'Analyze Cycles Individually',
                      style: TextStyle(
                        color: inversetextColor,
                        fontSize: 20,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WorkoutCategories()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                    ),
                    child: Text(
                      'Choose Another Workout',
                      style: TextStyle(
                        color: inversetextColor,
                        fontSize: 20,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Video URL: ${widget.videoURL}");
        },
        child: Icon(Icons.info),
      ),*/
    );
  }

  Widget _buildControlBar() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => _changeVolume(-0.1),
            icon: Icon(Icons.volume_down),
            iconSize: 32,
            color: iconColor,
          ),
          IconButton(
            onPressed: _jumpBackward,
            icon: Icon(Icons.skip_previous),
            iconSize: 32,
            color: iconColor,
          ),
          IconButton(
            onPressed: _togglePlayPause,
            icon: Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
            ),
            iconSize: 32,
            color: iconColor,
          ),
          IconButton(
            onPressed: _jumpForward,
            icon: Icon(Icons.skip_next),
            iconSize: 32,
            color: iconColor,
          ),
          IconButton(
            onPressed: () => _changeVolume(0.1),
            icon: Icon(Icons.volume_up),
            iconSize: 32,
            color: iconColor,
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget _buildExpandableBox(int index) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Calculate the box height and width based on screen dimensions and desired ratio
    final double boxHeight = screenHeight * (isExpanded[index] ? (ex(widget.exerciseName)?0.25:0.31 ): 0.11);
    final double boxWidth = screenWidth * 0.9; // Adjust the ratio as needed

    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        SizedBox(
          height: boxHeight,
          width: boxWidth,
          child: ExpandableBox(
            exerciseName:widget.exerciseName,
            title: ex(widget.exerciseName)?bicepexerciseFeedback[index]:lateralexerciseFeedback[index],
            isExpanded: isExpanded[index],
            feedback: ex(widget.exerciseName)? bicepfeedbackPoints.sublist(index * 3, index * 3 + 3):lateralfeedbackpoints.sublist(index * 3, index * 3 + 3),
            onToggle: () => setState(() {
              isExpanded[index] = !isExpanded[index];
            }),
            frontGifPath:
                'assets/gifs/${index + 1}front.gif', // Example path for front GIF
            sideGifPath:
                'assets/gifs/${index + 1}side.gif', // Example path for side GIF
          ),
        ),
      ],
    );
  }

  double getScale() {
    double videoRatio = _controller.value.aspectRatio;
    return videoRatio < videoContainerRatio
        ? videoContainerRatio / videoRatio
        : videoRatio / videoContainerRatio;
  }
}
