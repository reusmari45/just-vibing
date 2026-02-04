import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/tools_provider.dart';
import '../../widgets/section_header.dart';

class BatteryScreen extends ConsumerWidget {
  const BatteryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tips = ref.watch(batteryTipsProvider);

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('Battery & Performance', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 8),
          Text('Boost performance safely with memory cleanups and tips.',
              style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 20),
          Card(
            child: ListTile(
              leading: const Icon(Icons.speed_outlined),
              title: const Text('Memory cleanup'),
              subtitle: const Text('Free 640 MB by stopping background tasks.'),
              trailing: FilledButton(onPressed: () {}, child: const Text('Boost')),
            ),
          ),
          const SizedBox(height: 24),
          SectionHeader(title: 'Thermal & CPU tips'),
          const SizedBox(height: 12),
          for (final tip in tips)
            Card(
              child: ListTile(
                leading: const Icon(Icons.bolt_outlined),
                title: Text(tip.title),
                subtitle: Text(tip.detail),
              ),
            ),
        ],
      ),
    );
  }
}
