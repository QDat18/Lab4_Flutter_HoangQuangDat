import 'package:flutter/material.dart';

class Exercise2InputControls extends StatefulWidget {
  const Exercise2InputControls({super.key});

  @override
  State<Exercise2InputControls> createState() =>
      _Exercise2InputControlsState();
}

class _Exercise2InputControlsState extends State<Exercise2InputControls> {
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