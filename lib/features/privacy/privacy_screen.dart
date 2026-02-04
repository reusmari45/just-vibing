import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/tools_provider.dart';
import '../../widgets/section_header.dart';

class PrivacyScreen extends ConsumerWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final alerts = ref.watch(privacyAlertsProvider);
    final score = ref.watch(privacyScoreProvider);

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('Privacy Auditor', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 8),
          Text('Review sensitive permissions and improve your privacy score.',
              style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 20),
          Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                child: Text('$score', style: Theme.of(context).textTheme.headlineMedium),
              ),
              title: const Text('Privacy score'),
              subtitle: const Text('Higher is better. Tap to learn how to improve.'),
              trailing: const Icon(Icons.chevron_right),
            ),
          ),
          const SizedBox(height: 24),
          SectionHeader(title: 'Sensitive permissions'),
          const SizedBox(height: 12),
          for (final alert in alerts)
            Card(
              child: ListTile(
                leading: const Icon(Icons.warning_amber_outlined),
                title: Text(alert.appName),
                subtitle: Text('${alert.permission} • ${alert.riskLabel} risk'),
                trailing: TextButton(onPressed: () {}, child: const Text('Review')),
              ),
            ),
          const SizedBox(height: 24),
          FilledButton(onPressed: () {}, child: const Text('One-tap permission review')),
        ],
      ),
    );
  }
}
