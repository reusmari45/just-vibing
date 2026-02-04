import 'package:flutter_riverpod/flutter_riverpod.dart';

class StorageSummary {
  const StorageSummary({
    required this.usedGb,
    required this.totalGb,
    required this.junkGb,
    required this.duplicateCount,
  });

  final double usedGb;
  final double totalGb;
  final double junkGb;
  final int duplicateCount;
}

final storageSummaryProvider = Provider<StorageSummary>((ref) {
  return const StorageSummary(
    usedGb: 72.4,
    totalGb: 128,
    junkGb: 6.2,
    duplicateCount: 312,
  );
});

final cleanupStreakProvider = Provider<int>((ref) => 7);
