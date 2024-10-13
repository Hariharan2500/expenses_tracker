import 'package:flutter/material.dart';

class GoalsPage extends StatefulWidget {
  @override
  _GoalsPageState createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {
  String timePeriod = 'Day';
  double goalAmount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Goals')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Amount Required'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                goalAmount = double.tryParse(value) ?? 0;
              },
            ),
            DropdownButton<String>(
              value: timePeriod,
              onChanged: (String? newValue) {
                setState(() {
                  timePeriod = newValue!;
                });
              },
              items: <String>['Day', 'Month', 'Year'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Text('Selected time period: $timePeriod'),
          ],
        ),
      ),
    );
  }
}
