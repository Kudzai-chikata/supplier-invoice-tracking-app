import 'package:flutter/material.dart';

class LogInvoiceScreen extends StatelessWidget {
  final TextEditingController poController = TextEditingController();
  final TextEditingController invoiceController = TextEditingController();
  final TextEditingController driverController = TextEditingController();
  final TextEditingController vehicleController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log Supplier Invoice'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: poController,
              decoration: InputDecoration(labelText: 'PO Number'),
            ),
            TextField(
              controller: invoiceController,
              decoration: InputDecoration(labelText: 'Invoice Number'),
            ),
            TextField(
              controller: driverController,
              decoration: InputDecoration(labelText: 'Driver Name'),
            ),
            TextField(
              controller: vehicleController,
              decoration: InputDecoration(labelText: 'Vehicle Number Plate'),
            ),
            TextField(
              controller: notesController,
              decoration: InputDecoration(labelText: 'Notes'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle form submission
                final poNumber = poController.text;
                final invoiceNumber = invoiceController.text;
                final driverName = driverController.text;
                final vehicleNumber = vehicleController.text;
                final notes = notesController.text;
                // You may implement your logic here to log the invoice
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}