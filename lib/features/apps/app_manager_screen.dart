import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/tools_provider.dart';
import '../../widgets/section_header.dart';

class AppManagerScreen extends ConsumerWidget {
  const AppManagerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apps = ref.watch(appManagerProvider);
    final rareApps = apps.where((app) => app.isRarelyUsed).toList();

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('App Manager', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 8),
          Text('Uninstall or archive apps you no longer use.',
              style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 20),
          SectionHeader(title: 'Rarely used'),
          const SizedBox(height: 12),
          for (final app in rareApps)
            Card(
              child: ListTile(
                leading: const Icon(Icons.apps_outlined),
                title: Text(app.name),
                subtitle: Text('Last opened ${app.lastOpened} • ${app.storageMb.toStringAsFixed(0)} MB'),
                trailing: OutlinedButton(onPressed: () {}, child: const Text('Uninstall')),
              ),
            ),
          const SizedBox(height: 24),
          SectionHeader(title: 'All apps'),
          const SizedBox(height: 12),
          for (final app in apps)
            Card(
              child: ListTile(
                leading: const Icon(Icons.app_settings_alt_outlined),
                title: Text(app.name),
                subtitle: Text('Battery: ${app.batteryImpact} • Storage ${app.storageMb.toStringAsFixed(0)} MB'),
                trailing: Checkbox(value: false, onChanged: (_) {}),
              ),
            ),
          const SizedBox(height: 24),
          FilledButton(onPressed: () {}, child: const Text('Uninstall selected')),
        ],
      ),
    );
  }
}
