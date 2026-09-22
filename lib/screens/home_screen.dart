import 'package:flutter/material.dart';

import 'exercise1_core_widgets_demo.dart';
import 'exercise2_input_controls.dart';
import 'exercise3_layout_demo.dart';
import 'exercise4_app_structure.dart';
import 'exercise5_ui_fixes.dart';
import 'introduction_screen.dart';

class HomeScreen extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const HomeScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lab 4 - Flutter UI 22.09.2026',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          buildExerciseItem(
            context,
            title: 'Giới thiệu',
            screen: const IntroductionScreen(),
          ),
          buildExerciseItem(
            context,
            title: 'Exercise 1 - Core Widgets',
            screen: const Exercise1CoreWidgets(),
          ),

          buildExerciseItem(
            context,
            title: 'Exercise 2 - Input Controls',
            screen: const Exercise2InputControls(),
          ),

          buildExerciseItem(
            context,
            title: 'Exercise 3 - Layout Demo',
            screen: const Exercise3LayoutDemo(),
          ),

          buildExerciseItem(
            context,
            title: 'Exercise 4 - App Structure & Theme',
            screen: Exercise4AppStructure(
              isDarkMode: isDarkMode,
              onThemeChanged: onThemeChanged,
            ),
          ),

          buildExerciseItem(
            context,
            title: 'Exercise 5 - Common UI Fixes',
            screen: const Exercise5UiFixes(),
          ),
        ],
      ),
    );
  }

  Widget buildExerciseItem(
      BuildContext context, {
        required String title,
        required Widget screen,
      }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(title),
        trailing: const Icon(
          Icons.arrow_forward_ios,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => screen,
            ),
          );
        },
      ),
    );
  }
}