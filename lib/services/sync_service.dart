import 'package:workmanager/workmanager.dart';

class SyncService {
  static const String morningSyncTask = 'morningSyncTask';
  static const String eveningSyncTask = 'eveningSyncTask';

  static void initialize() {
    Workmanager().initialize(
      callbackDispatcher,
      isInDebugMode: true,
    );

    Workmanager().registerPeriodicTask(
      '1', // Unique task ID
      morningSyncTask,
      initialDelay: Duration(hours: 24), // Schedule for next morning
      frequency: Duration(hours: 24), // Repeat every day
    );

    Workmanager().registerPeriodicTask(
      '2', // Unique task ID
      eveningSyncTask,
      initialDelay: Duration(hours: 24), // Schedule for next evening
      frequency: Duration(hours: 24), // Repeat every day
    );
  }

  static void callbackDispatcher() {
    Workmanager().executeTask((task, inputData) async {
      switch (task) {
        case morningSyncTask:
          await loadMorningData();
          break;
        case eveningSyncTask:
          await synchronizeEveningData();
          break;
        default:
          print('Unknown task: $task');
      }
      return Future.value(true);
    });
  }

  static Future<void> loadMorningData() async {
    // Your morning data loading logic here
    print('Loading morning data...');
  }

  static Future<void> synchronizeEveningData() async {
    // Your evening data synchronization logic here
    print('Synchronizing evening data...');
  }
}
