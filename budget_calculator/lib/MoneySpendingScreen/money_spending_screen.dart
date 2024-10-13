

import 'package:flutter/material.dart';

class MoneySpendingPage extends StatefulWidget {
  @override
  _MoneySpendingPageState createState() => _MoneySpendingPageState();
}

class _MoneySpendingPageState extends State<MoneySpendingPage> {
  double income = 0;
  double spending = 0;
  double difference = 0;

  void calculateDifference() {
    setState(() {
      difference = income - spending;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Money Spending')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Income'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                income = double.tryParse(value) ?? 0;
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Spending'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                spending = double.tryParse(value) ?? 0;
              },
            ),
            ElevatedButton(
              onPressed: calculateDifference,
              child: Text('Calculate Difference'),
            ),
            Text('Difference: $difference'),
          ],
        ),
      ),
    );
  }
}
