// workout_categories_screen.dart

import 'package:flutter/material.dart';
import 'category_card.dart';
import 'start_button.dart';
import 'app_colors.dart';

class WorkoutCategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Categories'),
        backgroundColor: AppColors.colorScheme.primary,
      ),
      body: ListView(
        children: [
          CategoryCard(
            title: 'Beginner',
            workouts: 101,
            image: Placeholder(
              color: AppColors.colorScheme.secondaryVariant,
              strokeWidth: 2,
              child: Icon(Icons.fitness_center, size: 40),
            ),
          ),
          CategoryCard(
            title: 'Intermediate',
            workouts: 102,
            image: Placeholder(
              color: AppColors.colorScheme.secondaryVariant,
              strokeWidth: 2,
              child: Icon(Icons.dumbbell, size: 40),
            ),
          ),
          CategoryCard(
            title: 'Advanced',
            workouts: 103,
            image: Placeholder(
              color: AppColors.colorScheme.secondaryVariant,
              strokeWidth: 2,
              child: Icon(Icons.sports_martial, size: 40),
            ),
          ),
          SizedBox(height: 20),
          StartButton(text: 'Start', onPressed: () => // Your action here),
        ],
      ),
    );
  }
}
