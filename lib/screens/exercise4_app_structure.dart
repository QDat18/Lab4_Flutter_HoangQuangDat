import 'package:flutter/material.dart';

class Exercise4AppStructure extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const Exercise4AppStructure({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  State<Exercise4AppStructure> createState() =>
      _Exercise4AppStructureState();
}

class _Exercise4AppStructureState
    extends State<Exercise4AppStructure> {

  int counter = 0;

  late bool isDarkMode;

  @override
  void initState() {
    super.initState();

    // Lấy trạng thái theme hiện tại từ app
    isDarkMode = widget.isDarkMode;
  }

  void changeTheme(bool value) {
    // Cập nhật switch trong màn hình hiện tại
    setState(() {
      isDarkMode = value;
    });

    // Cập nhật theme của toàn bộ ứng dụng
    widget.onThemeChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        title: const Text(
          'Exercise 4 - App Structure',
        ),
      ),

      // Body
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Theme Settings',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            // Dark Mode toggle
            SwitchListTile(
              title: const Text('Dark Mode'),
              subtitle: Text(
                isDarkMode
                    ? 'Dark mode is ON'
                    : 'Dark mode is OFF',
              ),
              value: isDarkMode,
              onChanged: changeTheme,
            ),

            const SizedBox(height: 24),

            const Text(
              'Floating Action Button Demo',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              'Button clicked: $counter times',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),

      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}