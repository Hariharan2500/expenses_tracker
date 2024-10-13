import 'package:flutter/material.dart';

class InterestCalculatorPage extends StatefulWidget {
  @override
  _InterestCalculatorPageState createState() => _InterestCalculatorPageState();
}

class _InterestCalculatorPageState extends State<InterestCalculatorPage> {
  double principal = 0;
  double rate = 0;
  int time = 0;
  double interest = 0;

  void calculateInterest() {
    setState(() {
      interest = (principal * rate * time) / 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Interest Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Principal Amount'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                principal = double.tryParse(value) ?? 0;
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Rate of Interest'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                rate = double.tryParse(value) ?? 0;
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Time (in years)'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                time = int.tryParse(value) ?? 0;
              },
            ),
            ElevatedButton(
              onPressed: calculateInterest,
                            child: Text('Calculate Interest'),
            ),
            Text('Calculated Interest: $interest'),
          ],
        ),
      ),
    );
  }
}

