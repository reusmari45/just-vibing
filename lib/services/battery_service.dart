class BatteryTip {
  const BatteryTip({required this.title, required this.detail});

  final String title;
  final String detail;
}

class BatteryService {
  List<BatteryTip> fetchTips() {
    return const [
      BatteryTip(title: 'Disable auto-play', detail: 'Reduce background GPU usage in social apps.'),
      BatteryTip(title: 'Trim widget refresh', detail: 'Weather widgets refreshing every hour saves ~4% battery.'),
      BatteryTip(title: 'Close GPS-heavy apps', detail: '2 apps running constant location updates.'),
    ];
  }
}
