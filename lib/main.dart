import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supplier Invoice Tracking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home Screen'),
        ),
        body: Center(
          child: Text('Welcome to Supplier Invoice Tracking!'),
        ),
      ),
    );
  }
}