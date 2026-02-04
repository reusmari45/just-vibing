class DeviceApp {
  const DeviceApp({
    required this.name,
    required this.package,
    required this.lastOpened,
    required this.storageMb,
    required this.batteryImpact,
    required this.isRarelyUsed,
  });

  final String name;
  final String package;
  final String lastOpened;
  final double storageMb;
  final String batteryImpact;
  final bool isRarelyUsed;
}

class PermissionAlert {
  const PermissionAlert({
    required this.appName,
    required this.permission,
    required this.riskLabel,
  });

  final String appName;
  final String permission;
  final String riskLabel;
}

class VaultItem {
  const VaultItem({
    required this.name,
    required this.sizeMb,
    required this.encryptedOn,
  });

  final String name;
  final double sizeMb;
  final String encryptedOn;
}

class CleanupLogEntry {
  const CleanupLogEntry({
    required this.timestamp,
    required this.freedMb,
    required this.itemsRemoved,
  });

  final String timestamp;
  final double freedMb;
  final int itemsRemoved;
}
