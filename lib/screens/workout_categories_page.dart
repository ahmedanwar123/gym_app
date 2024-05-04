import 'package:flutter/material.dart';
import 'package:app/shared/theme.dart';
import 'package:app/widgets/CustomToggleButtons.dart';
import 'package:app/widgets/WorkoutCategory_Widget .dart';
import 'ExercisePopup.dart';

class WorkoutCategories extends StatefulWidget {
  const WorkoutCategories({Key? key}) : super(key: key);

  @override
  _WorkoutCategoriesState createState() => _WorkoutCategoriesState();
}

class _WorkoutCategoriesState extends State<WorkoutCategories> {
  late List<bool> _isSelected;
  String WorkoutName = "";
  String Workoutlevel = "Beginner";

  @override
  void initState() {
    super.initState();
    _isSelected = [true, false, false];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: bgColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Workout Categories',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontSize: 25.0,
            wordSpacing: 2.0,
            fontFamily: 'Roboto',
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomAppBar(
        color: secondaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              color: textColor,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.bar_chart),
              color: navbarColor,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              color: navbarColor,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.person),
              color: navbarColor,
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 8.0),
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: ToggleButton(
                  width: 360.0,
                  height: 35.0,
                  toggleBackgroundColor: unpressedToggleColor,
                  toggleBorderColor: unpressedToggleColor,
                  toggleColor: pressedtoggle,
                  activeTextColor: inversetextColor,
                  inactiveTextColor: textColor,
                  leftDescription: 'Beginner',
                  middleDescription: 'Intermediate',
                  rightDescription: 'Advanced',
                  onLeftToggleActive: () {
                    setState(() {
                      _isSelected = [true, false, false];
                      Workoutlevel = "Beginner";
                    });
                  },
                  onMiddleToggleActive: () {
                    setState(() {
                      _isSelected = [false, true, false];
                      Workoutlevel = "Intermediate";
                    });
                  },
                  onRightToggleActive: () {
                    setState(() {
                      _isSelected = [false, false, true];
                      Workoutlevel = "Advanced";
                    });
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                WorkoutCategoryWidget(
                  imagePath: 'assets/images/WorkoutCategories_BicepsCurl.png',
                  title: 'Dumbbell Biceps Curl',
                  workoutCount: '01',
                  selectedIndex: _isSelected.indexOf(true),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExercisePopup(
                          imagePath: 'assets/images/WorkoutCategories_BicepsCurl.png',
                          exerciseName: 'Dumbbell Biceps Curl',
                        ),
                      ),
                    );
                    WorkoutName = "Dumbbell Biceps Curl";
                  },
                ),
                WorkoutCategoryWidget(
                  imagePath: 'assets/images/LateralRaise.jpg',
                  title: 'Lateral Raise',
                  workoutCount: '02',
                  selectedIndex: _isSelected.indexOf(true),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExercisePopup(
                          imagePath: 'assets/images/LateralRaise.jpg',
                          exerciseName: 'Lateral Raise',
                        ),
                      ),
                    );
                    WorkoutName = "Lateral Raise";
                  },
                ),
                WorkoutCategoryWidget(
                  imagePath: 'assets/images/ComingSoon.jpg',
                  title: 'Coming Soon',
                  workoutCount: '03',
                  selectedIndex: _isSelected.indexOf(true),
                  onTap: () {
                    // Add navigation logic for coming soon category
                  },
                ),
                WorkoutCategoryWidget(
                  imagePath: 'assets/images/ComingSoon.jpg',
                  title: 'Coming Soon',
                  workoutCount: '04',
                  selectedIndex: _isSelected.indexOf(true),
                  onTap: () {
                    // Add navigation logic for coming soon category
                  },
                ),
                WorkoutCategoryWidget(
                  imagePath: 'assets/images/ComingSoon.jpg',
                  title: 'Coming Soon',
                  workoutCount: '05',
                  selectedIndex: _isSelected.indexOf(true),
                  onTap: () {
                    // Add navigation logic for coming soon category
                  },
                ),
                // Add more categories here if needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}
