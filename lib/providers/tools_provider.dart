import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/app_models.dart';
import '../services/app_manager_service.dart';
import '../services/battery_service.dart';
import '../services/privacy_service.dart';

final appManagerProvider = Provider<List<DeviceApp>>((ref) {
  return AppManagerService().fetchApps();
});

final privacyAlertsProvider = Provider<List<PermissionAlert>>((ref) {
  return PrivacyService().fetchAlerts();
});

final privacyScoreProvider = Provider<int>((ref) {
  final alerts = ref.watch(privacyAlertsProvider);
  return PrivacyService().calculatePrivacyScore(alerts);
});

final batteryTipsProvider = Provider<List<BatteryTip>>((ref) {
  return BatteryService().fetchTips();
});

final vaultItemsProvider = Provider<List<VaultItem>>((ref) {
  return const [
    VaultItem(name: 'Receipts.zip', sizeMb: 128, encryptedOn: 'Sep 2'),
    VaultItem(name: 'Private photos', sizeMb: 480, encryptedOn: 'Aug 28'),
  ];
});
