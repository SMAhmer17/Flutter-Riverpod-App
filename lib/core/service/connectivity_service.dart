
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';


class NoInternetException implements Exception {
  final String message;
  const NoInternetException([this.message = 'No internet connection.']);

  @override
  String toString() => 'NoInternetException: $message';
}

// ————————————————— Connectivity Service —————————————————

/// Reusable connectivity checker. Inject via constructor.
///
/// ```dart
/// final connectivity = ConnectivityService();
///
/// // One-off check
/// final isOnline = await connectivity.isConnected;
///
/// // Guard a network call
/// await connectivity.ensureConnected();
///
/// // React to changes
/// connectivity.onStatusChanged.listen((status) { ... });
/// ```
class ConnectivityService {

  final Connectivity _connectivity;


  ConnectivityService({Connectivity? connectivity})
      : _connectivity = connectivity ?? Connectivity();

  // ————————————————— Status —————————————————


  /// Returns `true` if any usable network interface is available.
  Future<bool> get isConnected async {
    final results = await _connectivity.checkConnectivity();
    return _hasConnection(results);
  }


  /// Returns the current list of [ConnectivityResult]s.
  Future<List<ConnectivityResult>> get currentStatus =>
      _connectivity.checkConnectivity();

  // ————————————————— Stream —————————————————


  /// Emits `true` / `false` whenever connectivity changes.
  Stream<bool> get onStatusChanged => _connectivity.onConnectivityChanged
      .map((results) => _hasConnection(results))
      .distinct();



  /// Raw stream of [ConnectivityResult] lists for fine-grained handling.
  Stream<List<ConnectivityResult>> get onConnectivityChanged =>
      _connectivity.onConnectivityChanged;

  // ————————————————— Guard —————————————————

  /// Throws [NoInternetException] if there is no active connection.
  /// Call this at the top of any network operation that needs a hard guard.
  ///
  /// ```dart
  /// await connectivity.ensureConnected();
  /// final data = await apiService.get('/endpoint');
  /// ```
  Future<void> ensureConnected() async {
    if (!await isConnected) throw const NoInternetException();
  }

  /// Runs [task] only if connected, otherwise throws [NoInternetException].
  Future<T> runIfConnected<T>(Future<T> Function() task) async {
    await ensureConnected();
    return task();
  }

  // ————————————————— Private Helpers —————————————————

  bool _hasConnection(List<ConnectivityResult> results) =>
      results.any((r) => r != ConnectivityResult.none);
}
