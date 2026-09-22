import 'package:flutter/material.dart';

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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
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
                  'Mã sinh viên: 26A4040725',
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