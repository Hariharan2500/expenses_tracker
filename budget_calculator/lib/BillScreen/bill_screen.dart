import 'package:flutter/material.dart';

class EmiBillPage extends StatefulWidget {
  const EmiBillPage({super.key});

  @override
  _EmiBillPageState createState() => _EmiBillPageState();
}

class _EmiBillPageState extends State<EmiBillPage> {
  List<Map<String, dynamic>> bills = [];

  void addBill(String name, double amount, DateTime date) {
    setState(() {
      bills.add({'name': name, 'amount': amount, 'date': date});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EMI/Bills')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text('Add EMI/Bill'),
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
                      onPressed: () {},
                      child: Text('Select Date'),
                    )
                  ],
                ),
              ),
            ),
            child: Text('Add Bill/EMI'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: bills.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(bills[index]['name']),
                  subtitle: Text('Amount: ${bills[index]['amount']}, Date: ${bills[index]['date']}'),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
