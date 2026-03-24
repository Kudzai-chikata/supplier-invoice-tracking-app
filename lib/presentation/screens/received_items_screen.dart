import 'package:flutter/material.dart';

class ReceivedItemsScreen extends StatefulWidget {
  @override
  _ReceivedItemsScreenState createState() => _ReceivedItemsScreenState();
}

class _ReceivedItemsScreenState extends State<ReceivedItemsScreen> {
  List<Map<String, String>> invoices = [
    {'po_number': 'PO1234', 'invoice_number': 'INV5678', 'driver_name': 'John Doe', 'vehicle_plate': 'XYZ 1234', 'status': 'Received'},
    {'po_number': 'PO2345', 'invoice_number': 'INV6789', 'driver_name': 'Jane Doe', 'vehicle_plate': 'ABC 5678', 'status': 'Pending'},
    // Add more invoices here
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Received Invoices'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                });
              },
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: invoices.length,
        itemBuilder: (context, index) {
          final invoice = invoices[index];
          if (invoice['po_number']!.toLowerCase().contains(searchQuery) || 
              invoice['invoice_number']!.toLowerCase().contains(searchQuery) || 
              invoice['driver_name']!.toLowerCase().contains(searchQuery) || 
              invoice['vehicle_plate']!.toLowerCase().contains(searchQuery) || 
              invoice['status']!.toLowerCase().contains(searchQuery)) {
            return ListTile(
              title: Text('PO: ${invoice['po_number']}, Invoice: ${invoice['invoice_number']}'),
              subtitle: Text('Driver: ${invoice['driver_name']}, Plate: ${invoice['vehicle_plate']}, Status: ${invoice['status']}'),
            );
          }
          return Container(); // Return empty container for non-matching items
        },
      ),
    );
  }
}