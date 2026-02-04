import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/duplicate_service.dart';
import '../../widgets/section_header.dart';

class DuplicatesScreen extends ConsumerStatefulWidget {
  const DuplicatesScreen({super.key});

  @override
  ConsumerState<DuplicatesScreen> createState() => _DuplicatesScreenState();
}

class _DuplicatesScreenState extends ConsumerState<DuplicatesScreen> {
  double _threshold = 0.82;

  @override
  Widget build(BuildContext context) {
    final service = DuplicateService();
    final exact = service.findExactDuplicates();
    final similar = service.findSimilar(threshold: _threshold);

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('Duplicate Finder', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 8),
          Text('Scan exact and similar files. Adjust similarity threshold.',
              style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 20),
          Card(
            child: ListTile(
              leading: const Icon(Icons.tune_outlined),
              title: const Text('Similarity threshold'),
              subtitle: Slider(
                value: _threshold,
                min: 0.6,
                max: 0.98,
                divisions: 8,
                label: _threshold.toStringAsFixed(2),
                onChanged: (value) => setState(() => _threshold = value),
              ),
            ),
          ),
          const SizedBox(height: 24),
          SectionHeader(title: 'Exact duplicates', actionLabel: 'Select all'),
          const SizedBox(height: 12),
          for (final group in exact)
            Card(
              child: ListTile(
                leading: const Icon(Icons.copy_all_outlined),
                title: Text('Group ${group.groupId}'),
                subtitle: Text(group.paths.join(' • ')),
                trailing: Checkbox(value: false, onChanged: (_) {}),
              ),
            ),
          const SizedBox(height: 24),
          SectionHeader(title: 'Similar photos'),
          const SizedBox(height: 12),
          for (final group in similar)
            Card(
              child: ListTile(
                leading: const Icon(Icons.collections_outlined),
                title: Text('Similar set ${group.groupId}'),
                subtitle: Text(group.paths.join(' • ')),
                trailing: Checkbox(value: false, onChanged: (_) {}),
              ),
            ),
          const SizedBox(height: 24),
          FilledButton(onPressed: () {}, child: const Text('Clean selected')),
        ],
      ),
    );
  }
}
