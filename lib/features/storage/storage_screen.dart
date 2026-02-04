import 'package:flutter/material.dart';

import '../../widgets/section_header.dart';

class StorageScreen extends StatelessWidget {
  const StorageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('Storage Analyzer', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 180,
                    child: _DonutPlaceholder(),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 12,
                    runSpacing: 8,
                    children: const [
                      _LegendItem(color: Colors.blue, label: 'Apps 42 GB'),
                      _LegendItem(color: Colors.orange, label: 'Media 18 GB'),
                      _LegendItem(color: Colors.teal, label: 'System 10 GB'),
                      _LegendItem(color: Colors.purple, label: 'Other 2.4 GB'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          SectionHeader(title: 'Large files'),
          const SizedBox(height: 12),
          const _FileRow(title: '4K travel footage', size: '3.1 GB', updated: 'Yesterday'),
          const _FileRow(title: 'Screen recordings', size: '1.2 GB', updated: '2 days ago'),
          const _FileRow(title: 'Podcast downloads', size: '840 MB', updated: 'Last week'),
          const SizedBox(height: 24),
          SectionHeader(title: 'Recommendations'),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: const Text('Clean similar photos'),
              subtitle: const Text('Free up ~1.4 GB in seconds.'),
              trailing: FilledButton(onPressed: () {}, child: const Text('Review')),
            ),
          ),
        ],
      ),
    );
  }
}

class _DonutPlaceholder extends StatelessWidget {
  const _DonutPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: SweepGradient(
              colors: [
                Colors.blue,
                Colors.blue,
                Colors.orange,
                Colors.orange,
                Colors.teal,
                Colors.teal,
                Colors.purple,
                Colors.purple,
              ],
              stops: [0, 0.5, 0.5, 0.72, 0.72, 0.9, 0.9, 1],
            ),
          ),
        ),
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            shape: BoxShape.circle,
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('72.4 GB', style: Theme.of(context).textTheme.headlineMedium),
            const Text('used'),
          ],
        ),
      ],
    );
  }
}

class _LegendItem extends StatelessWidget {
  const _LegendItem({required this.color, required this.label});

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(width: 10, height: 10, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 6),
        Text(label),
      ],
    );
  }
}

class _FileRow extends StatelessWidget {
  const _FileRow({required this.title, required this.size, required this.updated});

  final String title;
  final String size;
  final String updated;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.insert_drive_file_outlined),
        title: Text(title),
        subtitle: Text('Updated $updated'),
        trailing: Text(size, style: Theme.of(context).textTheme.bodyMedium),
      ),
    );
  }
}
