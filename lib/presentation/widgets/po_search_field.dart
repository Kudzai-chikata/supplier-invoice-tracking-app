import 'package:flutter/material.dart';

class POSearchField extends StatefulWidget {
  final List<String> purchaseOrders;
  final Function(String) onSelected;

  POSearchField({required this.purchaseOrders, required this.onSelected});

  @override
  _POSearchFieldState createState() => _POSearchFieldState();
}

class _POSearchFieldState extends State<POSearchField> {
  late TextEditingController _controller;
  List<String> _filteredPOs = [];

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void _filterPOs(String query) {
    if (query.isNotEmpty) {
      setState(() {
        _filteredPOs = widget.purchaseOrders
            .where((po) => po.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    } else {
      setState(() {
        _filteredPOs = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          onChanged: _filterPOs,
          decoration: InputDecoration(
            labelText: 'Search Purchase Order',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 8.0),
        _filteredPOs.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _filteredPOs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_filteredPOs[index]),
                    onTap: () {
                      widget.onSelected(_filteredPOs[index]);
                      _controller.clear();
                      setState(() {
                        _filteredPOs = [];
                      });
                    },
                  );
                },
              )
            : Container(),
      ],
    );
  }
}

// Usage Example:
//  POSearchField(
//    purchaseOrders: ['PO123', 'PO456', 'PO789'],
//    onSelected: (selectedPO) {
//      print('Selected Purchase Order: $selectedPO');
//    },
//  );
