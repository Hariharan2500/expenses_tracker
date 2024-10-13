

import 'package:flutter/material.dart';

class SurvivalPage extends StatefulWidget {
  @override
  _SurvivalPageState createState() => _SurvivalPageState();
}

class _SurvivalPageState extends State<SurvivalPage> {
  double moneyInHand = 0;
  double moneyRequiredPerMonth = 0;
  int monthsSurviving = 0;

  void calculateMonthsSurviving() {
    if (moneyRequiredPerMonth > 0) {
      setState(() {
        monthsSurviving = (moneyInHand / moneyRequiredPerMonth).floor();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Survival')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Money in Hand'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                moneyInHand = double.tryParse(value) ?? 0;
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Money Required Per Month'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                moneyRequiredPerMonth = double.tryParse(value) ?? 0;
              },
            ),
            ElevatedButton(
              onPressed: calculateMonthsSurviving,
              child: Text('Calculate Survival Months'),
            ),
            Text('Months you can survive: $monthsSurviving'),
          ],
        ),
      ),
    );
  }
}
