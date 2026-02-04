import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/clean_animation.dart';
import '../../widgets/section_header.dart';
import '../../providers/clean_provider.dart';

class CleanScreen extends ConsumerWidget {
  const CleanScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cleanState = ref.watch(cleanControllerProvider);
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('One-tap Smart Clean', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 8),
          Text('Safely remove cache and temporary files with undo.',
              style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 24),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  CleanAnimation(progress: cleanState.progress),
                  const SizedBox(height: 12),
                  LinearProgressIndicator(value: cleanState.progress),
                  const SizedBox(height: 12),
                  FilledButton.icon(
                    onPressed: () {
                      ref.read(cleanControllerProvider.notifier).startClean();
                      if (cleanState.progress >= 1) {
                        return;
                      }
                      if (cleanState.isCleaning) {
                        return;
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Cleaning in progress...'),
                          duration: const Duration(milliseconds: 600),
                        ),
                      );
                    },
                    icon: const Icon(Icons.auto_fix_high),
                    label: Text(cleanState.isCleaning ? 'Cleaning...' : 'Start Smart Clean'),
                  ),
                  if (cleanState.progress >= 1)
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text(
                        'Clean complete. ${(cleanState.freedMb / 1024).toStringAsFixed(1)} GB freed.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  if (cleanState.undoAvailable)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: OutlinedButton(
                        onPressed: () => ref.read(cleanControllerProvider.notifier).useUndo(),
                        child: const Text('Undo last clean (30s)'),
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          SectionHeader(title: 'What will be cleaned'),
          const SizedBox(height: 12),
          const _CleanItem(title: 'App cache', detail: '620 MB from social apps'),
          const _CleanItem(title: 'Hidden thumbnails', detail: '340 MB'),
          const _CleanItem(title: 'Ad leftovers', detail: '210 MB'),
          const SizedBox(height: 24),
          SectionHeader(title: 'Scheduled Auto-Clean'),
          const SizedBox(height: 12),
          Card(
            child: SwitchListTile(
              value: true,
              onChanged: (value) {},
              title: const Text('Run every night at 2:00 AM'),
              subtitle: const Text('Confirmation required if large deletions are detected.'),
            ),
          ),
          const SizedBox(height: 24),
          SectionHeader(title: 'Recent clean logs'),
          const SizedBox(height: 12),
          for (final log in cleanState.logs)
            Card(
              child: ListTile(
                leading: const Icon(Icons.history),
                title: Text(log.timestamp),
                subtitle: Text('${log.itemsRemoved} items removed'),
                trailing: Text('${log.freedMb.toStringAsFixed(0)} MB'),
              ),
            ),
        ],
      ),
    );
  }
}

class _CleanItem extends StatelessWidget {
  const _CleanItem({required this.title, required this.detail});

  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.check_circle_outline),
        title: Text(title),
        subtitle: Text(detail),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
