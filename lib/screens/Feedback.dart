import 'dart:io';
import 'package:app/screens/workout_categories_page.dart';
import 'package:app/screens/cyclesFeedback.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../shared/theme.dart';
import '../widgets/expandableBox_Widget.dart';

class Feedbacks extends StatefulWidget {
  const Feedbacks({Key? key, required this.videoURL}) : super(key: key);
  final String videoURL;

  @override
  State<Feedbacks> createState() => _FeedbackState();
}

class _FeedbackState extends State<Feedbacks> {
  late VideoPlayerController _controller;
  double _volumeLevel = 1.0;
  double videoContainerRatio = 0.5;
  late List<bool> isExpanded = [false, false, false];
  late int x =0;
  late int y =0;

  final List<String> exerciseFeedback = [
    'Form & Technique',
    'Stability',
    'Motion & Control'
  ];
  final List<String> feedbackPoints = [
    'Feedback Point A',
    'Feedback Point B',
    'Feedback Point C',
    'Feedback Point D',
    'Feedback Point E',
    'Feedback Point F',
    'Feedback Point G',
    'Feedback Point H',
    'Feedback Point I',
    'Feedback Point J',
    'Feedback Point K',
    'Feedback Point L',
    'Feedback Point M',
    'Feedback Point N',
  ];

  @override
  void initState() {
    super.initState();
    isExpanded = List.generate(3, (index) => false);
    _controller = VideoPlayerController.file(File(widget.videoURL))
      ..initialize().then((_) {
        setState(() {});
      })
      ..setLooping(true);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
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
            expandedHeight: MediaQuery.of(context).size.height * videoContainerRatio,
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
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: borderColor,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 12.0),
                              child: Text(
                                'Cycle Counter', // Text for the container
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 12.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Correct Cycles',
                                      style: TextStyle(
                                      color: textColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      x.toString(), // Text for the container
                                      style: TextStyle(
                                        color: textColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(12, 6, 12, 12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Wrong Cycles',
                                      style: TextStyle(
                                        color: textColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      y.toString(), // Text for the container
                                      style: TextStyle(
                                        color: textColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ]
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CyclesFeedback()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                    ),
                    child: Text(
                      'Analyze Cycles Individally',
                      style: TextStyle(
                        color: inversetextColor,
                        fontSize: 20,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                for (int i = 0; i < 3; i++) Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 4.0,),
                  child: _buildExpandableBox(i),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => WorkoutCategories()));
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Video URL: ${widget.videoURL}");
        },
        child: Icon(Icons.info),
      ),
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
    final double boxHeight = screenHeight * (isExpanded[index] ? 0.3 : 0.13);
    final double boxWidth = screenWidth * 0.9; // Adjust the ratio as needed

    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        SizedBox(
          height: boxHeight,
          width: boxWidth,
          child: ExpandableBox(
            title: exerciseFeedback[index],
            isExpanded: isExpanded[index],
            feedback: feedbackPoints.sublist(index * 3, index * 3 + 3),
            onToggle: () => setState(() {
              isExpanded[index] = !isExpanded[index];
            }),
            frontGifPath: 'assets/gifs/${index + 1}front.gif', // Example path for front GIF
            sideGifPath: 'assets/gifs/${index + 1}side.gif', // Example path for side GIF
          ),
        ),
      ],
    );
  }


  double getScale() {
    double videoRatio = _controller.value.aspectRatio;
    return videoRatio < videoContainerRatio ? videoContainerRatio / videoRatio : videoRatio / videoContainerRatio;
  }
}
