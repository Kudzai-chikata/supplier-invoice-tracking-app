import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // Sync schedule configuration
  String syncSchedule = 'Daily'; // e.g., Daily, Weekly, etc.

  // App information
  String appVersion = '1.0.0';
  String appName = 'Supplier Invoice Tracking App';

  // Manual sync trigger
  void manualSync() {
    // Logic for manual sync
  }

  // Guard login
  bool isGuardLogin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: Text('Sync Schedule'),
              subtitle: Text(syncSchedule),
              onTap: () {
                // Logic to change sync schedule
              },
            ),
            ListTile(
              title: Text('Manual Sync'),
              onTap: manualSync,
            ),
            ListTile(
              title: Text('Guard Login'),
              trailing: Switch(
                value: isGuardLogin,
                onChanged: (value) {
                  setState(() {
                    isGuardLogin = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('App Information'),
              subtitle: Text('$appName v$appVersion'),
            ),
          ],
        ),
      ),
    );
  }
}