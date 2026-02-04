import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/dashboard_provider.dart';
import '../../widgets/metric_card.dart';
import '../../widgets/section_header.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary = ref.watch(storageSummaryProvider);
    final streak = ref.watch(cleanupStreakProvider);

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('Good afternoon, Jamie', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 8),
          Text('Your device health is 86%', style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 20),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Storage overview', style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: 8),
                  Text('${summary.usedGb} GB of ${summary.totalGb} GB used'),
                  const SizedBox(height: 12),
                  LinearProgressIndicator(value: summary.usedGb / summary.totalGb),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 12,
                    children: [
                      _InfoChip(label: '${summary.junkGb} GB junk ready'),
                      _InfoChip(label: '${summary.duplicateCount} duplicates found'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          SectionHeader(title: 'Quick actions', actionLabel: 'See all', onTap: () {}),
          const SizedBox(height: 12),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 1.1,
            children: [
              MetricCard(
                title: 'Junk files',
                value: '${summary.junkGb} GB',
                subtitle: 'Safe to delete',
                icon: Icons.cleaning_services_outlined,
                onTap: () => context.go('/clean'),
              ),
              MetricCard(
                title: 'Duplicates',
                value: '${summary.duplicateCount}',
                subtitle: 'Photos & files',
                icon: Icons.copy_all_outlined,
                onTap: () => context.go('/tools/duplicates'),
              ),
              MetricCard(
                title: 'Battery boost',
                value: '4 apps',
                subtitle: 'High usage',
                icon: Icons.bolt_outlined,
                onTap: () => context.go('/tools/battery'),
              ),
              MetricCard(
                title: 'Privacy audit',
                value: '12 alerts',
                subtitle: 'Sensitive access',
                icon: Icons.shield_outlined,
                onTap: () => context.go('/tools/privacy'),
              ),
            ],
          ),
          const SizedBox(height: 24),
          SectionHeader(title: 'Streaks & rewards', actionLabel: 'Share'),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    child: Text('$streak', style: Theme.of(context).textTheme.headlineMedium),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Cleanup streak', style: Theme.of(context).textTheme.bodyMedium),
                        const SizedBox(height: 4),
                        Text('You have cleaned for $streak days in a row!',
                            style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                  ),
                  FilledButton(onPressed: () {}, child: const Text('Share')),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          SectionHeader(title: 'Daily tip'),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Turn on Auto-Clean to remove hidden cache every night with a 30-second undo window.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Card(
            child: ListTile(
              leading: const Icon(Icons.school_outlined),
              title: const Text('Take the CleanFlow walkthrough'),
              subtitle: const Text('3 quick steps to learn privacy-first cleaning.'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.go('/onboarding'),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
    );
  }
}
