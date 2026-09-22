import 'package:flutter/material.dart';

class Exercise5UiFixes extends StatefulWidget {
  const Exercise5UiFixes({super.key});

  @override
  State<Exercise5UiFixes> createState() => _Exercise5UiFixesState();
}

class _Exercise5UiFixesState extends State<Exercise5UiFixes> {
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
                // Update UI state
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