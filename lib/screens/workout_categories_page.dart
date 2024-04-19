import 'dart:ui';
import 'package:flutter/material.dart';
import 'BC_Popup.dart';
import 'LR_Popup.dart';

class WorkoutCategories extends StatefulWidget {
  const WorkoutCategories({Key? key}) : super(key: key);

  @override
  _WorkoutCategoriesState createState() => _WorkoutCategoriesState();
}

class _WorkoutCategoriesState extends State<WorkoutCategories> {
  late List<bool> _isSelected;

  @override
  void initState() {
    super.initState();
    _isSelected = [true, false, false]; // Default selected is Beginner
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Text(
          'Workout Categories',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 25.0,
            wordSpacing: 2.0,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              color: Colors.white,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.bar_chart),
              color: Colors.grey[500],
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              color: Colors.grey[500],
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.person),
              color: Colors.grey[500],
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.7, // Adjust the width as needed
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.grey[700]!), // Add border for unselected buttons
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ToggleButtons(
                      children: <Widget>[
                        Expanded(
                          child: Text('    Beginner  ', style: TextStyle(color: Colors.white)),
                        ),
                        Expanded(
                          child: Text('    Intermediate    ', style: TextStyle(color: Colors.white)),
                        ),
                        Expanded(
                          child: Text('    Advanced   ', style: TextStyle(color: Colors.white)),
                        ),
                      ],
                      isSelected: _isSelected,
                      onPressed: (int index) {
                        setState(() {
                          _isSelected = List.generate(_isSelected.length, (i) => i == index);
                        });
                      },
                      fillColor: Color(0xFFFF8F00),
                      selectedColor: Color(0xFFFF8F00),
                      borderRadius: BorderRadius.circular(50.0), // Set 0 to remove rounded corners
                      selectedBorderColor: Color(0xFFFF8F00),
                      borderColor: Colors.transparent, // Set transparent to hide borders between buttons
                      borderWidth: 0, // Set 0 to hide borders between buttons
                      textStyle: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                )
              )

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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BC_Popup()));
                  },
                ),
                WorkoutCategoryWidget(
                  imagePath: 'assets/images/LateralRaise.jpg',
                  title: 'Lateral Raise',
                  workoutCount: '02',
                  selectedIndex: _isSelected.indexOf(true),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LR_Popup()));
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
                // Add more categories here if needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WorkoutCategoryWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String workoutCount;
  final int selectedIndex;
  final VoidCallback onTap;

  const WorkoutCategoryWidget({
    required this.imagePath,
    required this.title,
    required this.workoutCount,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
          height: 250.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(width: 15.0),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 1.0),
              Row(
                children: [
                  SizedBox(width: 15.0),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Text(
                      '| $workoutCount Workouts for ${selectedIndex == 0 ? "Beginner" : selectedIndex == 1 ? "Intermediate" : "Advanced"}',
                      style: TextStyle(
                        color: Color(0xFFFF8F00),
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}


