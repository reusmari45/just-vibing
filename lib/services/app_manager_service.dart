import '../models/app_models.dart';

class AppManagerService {
  List<DeviceApp> fetchApps() {
    return const [
      DeviceApp(
        name: 'Streamly',
        package: 'com.streamly.app',
        lastOpened: '2 days ago',
        storageMb: 1420,
        batteryImpact: 'High',
        isRarelyUsed: false,
      ),
      DeviceApp(
        name: 'PhotoSpark',
        package: 'com.photospark.app',
        lastOpened: '3 weeks ago',
        storageMb: 980,
        batteryImpact: 'Medium',
        isRarelyUsed: true,
      ),
      DeviceApp(
        name: 'FitPulse',
        package: 'com.fitpulse.app',
        lastOpened: '1 month ago',
        storageMb: 620,
        batteryImpact: 'Low',
        isRarelyUsed: true,
      ),
    ];
  }
}
