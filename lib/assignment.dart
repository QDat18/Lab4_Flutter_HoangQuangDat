// ASSM1 - Flutter UI Fundamentals
// Họ và tên: Hoàng Quang Đạt
// Mã sinh viên: 26A4040725
// Lớp: K26CNTTA
// GitHub: https://github.com/QDat18/Lab4_Flutter_HoangQuangDat.git

import 'package:flutter/material.dart';

void main() {
  runApp(const AssignmentApp());
}

class AssignmentApp extends StatefulWidget {
  const AssignmentApp({super.key});

  @override
  State<AssignmentApp> createState() => _AssignmentAppState();
}

class _AssignmentAppState extends State<AssignmentApp> {
  bool isDarkMode = false;

  void toggleTheme(bool value) {
    setState(() {
      isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ASSM1 - Flutter UI Fundamentals',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),

      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),

      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,

      home: HomeScreen(
        isDarkMode: isDarkMode,
        onThemeChanged: toggleTheme,
      ),
    );
  }
}

// =====================================================
// HOME SCREEN
// =====================================================

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
        title: const Text('ASSM1 - Flutter UI Fundamentals'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          buildItem(
            context,
            'Giới thiệu',
            const IntroductionScreen(),
          ),
          buildItem(
            context,
            'Exercise 1 - Core Widgets',
            const Exercise1CoreWidgets(),
          ),
          buildItem(
            context,
            'Exercise 2 - Input Controls',
            const Exercise2InputControls(),
          ),
          buildItem(
            context,
            'Exercise 3 - Layout Demo',
            const Exercise3LayoutDemo(),
          ),
          buildItem(
            context,
            'Exercise 4 - App Structure & Theme',
            Exercise4AppStructure(
              isDarkMode: isDarkMode,
              onThemeChanged: onThemeChanged,
            ),
          ),
          buildItem(
            context,
            'Exercise 5 - Common UI Fixes',
            const Exercise5UiFixes(),
          ),
        ],
      ),
    );
  }

  Widget buildItem(
      BuildContext context,
      String title,
      Widget screen,
      ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios),
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

// =====================================================
// INTRODUCTION
// =====================================================

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giới thiệu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Center(
                  child: Icon(
                    Icons.person,
                    size: 80,
                    color: Colors.blue,
                  ),
                ),

                SizedBox(height: 20),

                Center(
                  child: Text(
                    'ASSM1 - Flutter UI Fundamentals',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 24),

                Text(
                  'Thông tin sinh viên',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 12),

                Text(
                  'Họ và tên: Hoàng Quang Đạt',
                  style: TextStyle(fontSize: 17),
                ),

                SizedBox(height: 8),

                Text(
                  'Mã sinh viên: [Điền mã sinh viên]',
                  style: TextStyle(fontSize: 17),
                ),

                SizedBox(height: 8),

                Text(
                  'Lớp: K26CNTTA',
                  style: TextStyle(fontSize: 17),
                ),

                SizedBox(height: 24),

                Text(
                  'Nội dung bài tập',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 12),

                Text(
                  'Bài tập gồm 5 phần về Flutter UI Fundamentals, '
                      'bao gồm Core Widgets, Input Widgets, Layout, '
                      'Scaffold & Theme và xử lý các lỗi UI phổ biến.',
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
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

// =====================================================
// EXERCISE 1
// =====================================================

class Exercise1CoreWidgets extends StatelessWidget {
  const Exercise1CoreWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 1 - Core Widgets'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Welcome to Flutter UI',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            const Icon(
              Icons.movie,
              size: 60,
              color: Colors.blue,
            ),

            const SizedBox(height: 20),

            Image.network(
              'https://picsum.photos/500/250',
              height: 200,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox(
                  height: 200,
                  child: Center(
                    child: Text('Failed to load image'),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            const Card(
              child: ListTile(
                leading: Icon(Icons.star),
                title: Text('Movie Item'),
                subtitle: Text(
                  'This is a sample ListTile inside a Card',
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// EXERCISE 2
// =====================================================

class Exercise2InputControls extends StatefulWidget {
  const Exercise2InputControls({super.key});

  @override
  State<Exercise2InputControls> createState() =>
      _Exercise2InputControlsState();
}

class _Exercise2InputControlsState
    extends State<Exercise2InputControls> {
  double sliderValue = 50;
  bool switchValue = false;
  String selectedOption = 'Option 1';
  DateTime? selectedDate;

  Future<void> pickDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 2 - Input Controls'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Slider',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            Slider(
              value: sliderValue,
              min: 0,
              max: 100,
              divisions: 10,
              label: sliderValue.round().toString(),
              onChanged: (value) {
                setState(() {
                  sliderValue = value;
                });
              },
            ),

            Text(
              'Slider value: ${sliderValue.round()}',
            ),

            const SizedBox(height: 20),

            const Text(
              'Switch',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SwitchListTile(
              title: const Text('Enable feature'),
              value: switchValue,
              onChanged: (value) {
                setState(() {
                  switchValue = value;
                });
              },
            ),

            Text(
              'Switch: ${switchValue ? "ON" : "OFF"}',
            ),

            const SizedBox(height: 20),

            const Text(
              'Radio Options',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            RadioListTile<String>(
              title: const Text('Option 1'),
              value: 'Option 1',
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                });
              },
            ),

            RadioListTile<String>(
              title: const Text('Option 2'),
              value: 'Option 2',
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                });
              },
            ),

            Text(
              'Selected: $selectedOption',
            ),

            const SizedBox(height: 20),

            const Text(
              'Date Picker',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: pickDate,
              child: const Text('Choose Date'),
            ),

            const SizedBox(height: 10),

            Text(
              selectedDate == null
                  ? 'No date selected'
                  : 'Selected date: '
                  '${selectedDate!.day}/'
                  '${selectedDate!.month}/'
                  '${selectedDate!.year}',
            ),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// EXERCISE 3
// =====================================================

class Exercise3LayoutDemo extends StatelessWidget {
  const Exercise3LayoutDemo({super.key});

  final List<Map<String, String>> movies = const [
    {
      'title': 'Mai',
      'year': '2024',
      'description':
      'Mai kể về một người phụ nữ có cuộc sống nhiều khó khăn '
          'và những biến cố trong tình cảm. Bộ phim tập trung vào '
          'câu chuyện tình yêu, gia đình và những lựa chọn trong cuộc sống.'
    },
    {
      'title': 'Nhà Bà Nữ',
      'year': '2023',
      'description':
      'Nhà Bà Nữ xoay quanh một gia đình nhiều thế hệ sống cùng nhau. '
          'Những mâu thuẫn giữa cha mẹ và con cái dần bộc lộ.'
    },
    {
      'title': 'Bố Già',
      'year': '2021',
      'description':
      'Bố Già kể về cuộc sống của một gia đình lao động tại Sài Gòn. '
          'Bộ phim khai thác tình cảm cha con và sự khác biệt giữa các thế hệ.'
    },
    {
      'title': 'Mắt Biếc',
      'year': '2019',
      'description':
      'Mắt Biếc kể về tình cảm của Ngạn dành cho Hà Lan từ khi còn nhỏ '
          'và những câu chuyện tình cảm đầy tiếc nuối.'
    },
    {
      'title': 'Hai Phượng',
      'year': '2019',
      'description':
      'Hai Phượng kể về hành trình của một người mẹ tìm kiếm con gái '
          'sau khi cô bé bị bắt cóc.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 3 - Layout Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Phim điện ảnh Việt Nam',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            const Row(
              children: [
                Icon(Icons.movie),
                SizedBox(width: 8),
                Text(
                  'Danh sách phim nổi bật',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            Expanded(
              child: ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];

                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                      ),
                      title: Text(movie['title']!),
                      subtitle: Text(
                        'Năm: ${movie['year']}',
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MovieDetailScreen(
                                  title: movie['title']!,
                                  year: movie['year']!,
                                  description:
                                  movie['description']!,
                                ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieDetailScreen extends StatelessWidget {
  final String title;
  final String year;
  final String description;

  const MovieDetailScreen({
    super.key,
    required this.title,
    required this.year,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.movie,
              size: 80,
              color: Colors.blue,
            ),

            const SizedBox(height: 16),

            Text(
              title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'Năm phát hành: $year',
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 16),

            const Text(
              'Nội dung phim',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// EXERCISE 4
// =====================================================

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
    isDarkMode = widget.isDarkMode;
  }

  void changeTheme(bool value) {
    setState(() {
      isDarkMode = value;
    });

    widget.onThemeChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Exercise 4 - App Structure',
        ),
      ),
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
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
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

// =====================================================
// EXERCISE 5
// =====================================================

class Exercise5UiFixes extends StatefulWidget {
  const Exercise5UiFixes({super.key});

  @override
  State<Exercise5UiFixes> createState() =>
      _Exercise5UiFixesState();
}

class _Exercise5UiFixesState
    extends State<Exercise5UiFixes> {
  int counter = 0;
  DateTime? selectedDate;

  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  Future<void> pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 5 - UI Fixes'),
      ),

      // Fix overflow on small screens
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Common UI Errors & Fixes',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              '1. ListView inside Column',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Fix: Use Expanded to give ListView available space.',
            ),

            const SizedBox(height: 12),

            SizedBox(
              height: 220,
              child: Column(
                children: [
                  const Text(
                    'Item List',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Fix ListView inside Column
                  Expanded(
                    child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: const Icon(Icons.list),
                            title: Text(items[index]),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 16),

            const Text(
              '2. Screen Overflow',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Fix: Use SingleChildScrollView so the screen can scroll.',
            ),

            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 16),

            const Text(
              '3. State Update',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Fix: Use setState() after changing a value.',
            ),

            const SizedBox(height: 12),

            Text(
              'Counter: $counter',
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 8),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  counter++;
                });
              },
              child: const Text('Increase Counter'),
            ),

            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 16),

            const Text(
              '4. DatePicker BuildContext',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Fix: Use a valid BuildContext from the widget tree.',
            ),

            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () {
                pickDate(context);
              },
              child: const Text('Choose Date'),
            ),

            const SizedBox(height: 8),

            Text(
              selectedDate == null
                  ? 'No date selected'
                  : 'Selected date: '
                  '${selectedDate!.day}/'
                  '${selectedDate!.month}/'
                  '${selectedDate!.year}',
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}