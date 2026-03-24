import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            title: Text('Log Invoice'),
            onTap: () {
              // Navigate to Log Invoice Screen
            },
          ),
          ListTile(
            title: Text('View Received Items'),
            onTap: () {
              // Navigate to View Received Items Screen
            },
          ),
          ListTile(
            title: Text('Reports'),
            onTap: () {
              // Navigate to Reports Screen
            },
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Sync Status: Online',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}