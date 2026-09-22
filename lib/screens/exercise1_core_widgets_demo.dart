import 'package:flutter/material.dart';

class Exercise1CoreWidgets extends StatelessWidget{
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
            // icon
            const Icon(
              Icons.movie,
              size: 60,
              color: Colors.blue,
            ),

            const SizedBox(height: 20),
            // image
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
            // card containing
            const Card(
              child: ListTile(
                leading: Icon(Icons.star),
                title: Text('Movie Item'),
                subtitle: Text('Dat la vi du ve ListTitle trong 1 the Card'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ],
        ),
      ),
    );
  }
}