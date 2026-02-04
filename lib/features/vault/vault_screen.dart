import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/tools_provider.dart';
import '../../widgets/section_header.dart';

class VaultScreen extends ConsumerWidget {
  const VaultScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(vaultItemsProvider);

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('Safe Vault', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 8),
          Text('Encrypt sensitive files locally with AES-256 and biometric unlock.',
              style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 20),
          Card(
            child: ListTile(
              leading: const Icon(Icons.lock_outline),
              title: const Text('Vault security'),
              subtitle: const Text('Biometric unlock enabled'),
              trailing: FilledButton(onPressed: () {}, child: const Text('Manage')),
            ),
          ),
          const SizedBox(height: 24),
          SectionHeader(title: 'Encrypted files'),
          const SizedBox(height: 12),
          for (final item in items)
            Card(
              child: ListTile(
                leading: const Icon(Icons.folder_special_outlined),
                title: Text(item.name),
                subtitle: Text('Encrypted on ${item.encryptedOn}'),
                trailing: Text('${item.sizeMb.toStringAsFixed(0)} MB'),
              ),
            ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.upload_file_outlined),
            label: const Text('Add files to vault'),
          ),
        ],
      ),
    );
  }
}
