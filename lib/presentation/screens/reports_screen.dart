import 'package:flutter/material.dart';

class ReportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Reconciliation Report'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Received vs Expected Items', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            // Add your implementation for received vs expected items
            SizedBox(height: 20),
            Text('Guard Audit Logs', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            // Add your implementation for guard audit logs
            SizedBox(height: 20),
            Text('Summary Statistics', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            // Add your implementation for summary statistics
          ],
        ),
      ),
    );
  }
}