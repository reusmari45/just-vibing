import '../models/app_models.dart';

class PrivacyService {
  List<PermissionAlert> fetchAlerts() {
    return const [
      PermissionAlert(appName: 'Streamly', permission: 'Microphone', riskLabel: 'High'),
      PermissionAlert(appName: 'Mapster', permission: 'Location (Always)', riskLabel: 'High'),
      PermissionAlert(appName: 'PhotoSpark', permission: 'Contacts', riskLabel: 'Medium'),
      PermissionAlert(appName: 'FlashDeal', permission: 'SMS', riskLabel: 'Medium'),
    ];
  }

  int calculatePrivacyScore(List<PermissionAlert> alerts) {
    final penalty = alerts.length * 6;
    final score = 100 - penalty;
    return score.clamp(40, 100);
  }
}
