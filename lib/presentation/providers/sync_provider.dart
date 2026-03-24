import 'package:flutter_riverpod/flutter_riverpod.dart';

// Enum to represent the sync status
enum SyncStatus {
  idle,
  syncing,
  success,
  failure,
}

// Class to manage sync operations
class SyncProvider extends StateNotifier<SyncStatus> {
  SyncProvider() : super(SyncStatus.idle);

  // Method to start syncing
  Future<void> startSync() async {
    state = SyncStatus.syncing;
    try {
      // Simulating a network call or background task
      await Future.delayed(Duration(seconds: 2));
      // Assuming sync is successful
      state = SyncStatus.success;
    } catch (e) {
      // Handle errors
      state = SyncStatus.failure;
    }
  }

  // Method to reset the sync status
  void reset() {
    state = SyncStatus.idle;
  }
}

// Provider instance
final syncProvider = StateNotifierProvider<SyncProvider, SyncStatus>((ref) {
  return SyncProvider();
});
