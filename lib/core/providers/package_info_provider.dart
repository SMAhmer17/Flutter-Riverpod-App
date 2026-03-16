import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider for [PackageInfo] to get app version details.
/// This is overridden in main.dart.
final packageInfoProvider = Provider<PackageInfo>((ref) {
  throw UnimplementedError(
    'packageInfoProvider must be overridden in main.dart',
  );
});
