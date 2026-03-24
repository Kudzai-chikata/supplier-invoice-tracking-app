import 'package:flutter/material.dart';

class InvoiceCard extends StatelessWidget {
  final String driverInfo;
  final String vehiclePlate;
  final String timestamp;

  const InvoiceCard({Key? key, required this.driverInfo, required this.vehiclePlate, required this.timestamp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Driver: \$driverInfo',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Vehicle Plate: \$vehiclePlate',
              style: const TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Timestamp: \$timestamp',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}