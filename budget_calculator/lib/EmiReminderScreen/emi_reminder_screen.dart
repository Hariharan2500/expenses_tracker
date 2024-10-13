import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting the date

class EmiReminderPage extends StatefulWidget {
  @override
  _EmiReminderPageState createState() => _EmiReminderPageState();
}

class _EmiReminderPageState extends State<EmiReminderPage> {
  List<Map<String, dynamic>> bills = [];
  DateTime today = DateTime.now();

  void addBillReminder(String name, double amount, DateTime dueDate) {
    setState(() {
      bills.add({
        'name': name,
        'amount': amount,
        'dueDate': dueDate,
        'daysLeft': dueDate.difference(today).inDays
      });
    });
  }

  String getReminderMessage(int daysLeft) {
    if (daysLeft >= 7) {
      return 'Reminder: Due in $daysLeft days';
    } else if (daysLeft == 3) {
      return 'Reminder: Due in 3 days';
    } else if (daysLeft == 1) {
      return 'Reminder: Due tomorrow';
    } else if (daysLeft == 0) {
      return 'Reminder: Due today';
    } else {
      return 'No reminder';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EMI/Bill Reminder')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text('Add EMI/Bill Reminder'),
                content: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Bill/EMI Name'),
                      onChanged: (value) {},
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {},
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Pick date logic here (use showDatePicker for simplicity)
                      },
                      child: Text('Select Due Date'),
                    ),
                  ],
                ),
              ),
            ),
            child: Text('Add Bill/EMI Reminder'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: bills.length,
              itemBuilder: (context, index) {
                final bill = bills[index];
                return ListTile(
                  title: Text(bill['name']),
                  subtitle: Text(
                    'Amount: ${bill['amount']}, Due Date: ${DateFormat('yyyy-MM-dd').format(bill['dueDate'])}, ${getReminderMessage(bill['daysLeft'])}',
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
