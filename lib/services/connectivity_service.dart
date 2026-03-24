import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();
  StreamController<ConnectivityResult> _controller = StreamController<ConnectivityResult>();

  ConnectivityService() {
    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      _controller.add(result);
    });
  }

  // Expose the connectivity stream
  Stream<ConnectivityResult> get connectivityStream => _controller.stream;

  // Check current connectivity status
  Future<ConnectivityResult> checkCurrentStatus() async {
    return await _connectivity.checkConnectivity();
  }

  // Dispose the stream controller
  void dispose() {
    _controller.close();
  }
}