

import 'package:budget_calculator/BillScreen/bill_screen.dart';
import 'package:budget_calculator/EmiReminderScreen/emi_reminder_screen.dart';
import 'package:budget_calculator/GoalScreen/goal_screen.dart';
import 'package:budget_calculator/InterestCalculatorScreen/interest_calculator_screen.dart';
import 'package:budget_calculator/MoneySpendingScreen/money_spending_screen.dart';
import 'package:budget_calculator/SurvivalScreen/survival_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expense Tracker')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Survival Page'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SurvivalPage())),
          ),
          ListTile(
            title: Text('EMI/Bill Page'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => EmiBillPage())),
          ),
          ListTile(
            title: Text('Goals Page'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => GoalsPage())),
          ),
          ListTile(
            title: Text('Money Spending Page'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MoneySpendingPage())),
          ),
          ListTile(
            title: Text('Interest Calculator Page'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => InterestCalculatorPage())),
          ),
          ListTile(
            title: Text('EMI/Bill Reminder Page'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => EmiReminderPage())),
          ),
        ],
      ),
    );
  }
}
