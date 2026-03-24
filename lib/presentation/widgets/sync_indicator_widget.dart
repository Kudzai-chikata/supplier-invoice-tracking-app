import 'package:flutter/material.dart';

class SyncIndicatorWidget extends StatelessWidget {
  final bool isOnline;
  final DateTime lastSyncTime;
  final int pendingItemsCount;

  SyncIndicatorWidget({required this.isOnline, required this.lastSyncTime, required this.pendingItemsCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration( // Add styling and color based on online/offline status
        color: isOnline ? Colors.green[100] : Colors.red[100],
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: isOnline ? Colors.green : Colors.red),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isOnline ? 'Status: Online' : 'Status: Offline',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isOnline ? Colors.green[800] : Colors.red[800],
                ),
              ),
              SizedBox(height: 4),
              Text('Last Sync: ${lastSyncTime.toUtc().toString()}'),
              SizedBox(height: 4),
              Text('Pending items: $pendingItemsCount'),
            ],
          ),
          Icon(
            isOnline ? Icons.check_circle : Icons.error,
            color: isOnline ? Colors.green : Colors.red,
            size: 40,
          ),
        ],
      ),
    );
  }
}