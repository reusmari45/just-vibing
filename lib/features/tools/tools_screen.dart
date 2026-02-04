import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/section_header.dart';

class ToolsScreen extends StatelessWidget {
  const ToolsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('Tools & Protection', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 16),
          SectionHeader(title: 'Device Optimizers'),
          const SizedBox(height: 12),
          _ToolTile(
            icon: Icons.copy_all_outlined,
            title: 'Duplicate finder',
            subtitle: 'Exact & similar photo cleanup with preview.',
            onTap: () => context.go('/tools/duplicates'),
          ),
          _ToolTile(
            icon: Icons.bolt_outlined,
            title: 'Battery & performance boost',
            subtitle: 'Stop background drains and cool device.',
            onTap: () => context.go('/tools/battery'),
          ),
          _ToolTile(
            icon: Icons.apps_outlined,
            title: 'App manager',
            subtitle: 'Multi-uninstall and rare usage insights.',
            onTap: () => context.go('/tools/apps'),
          ),
          const SizedBox(height: 24),
          SectionHeader(title: 'Privacy & Security'),
          const SizedBox(height: 12),
          _ToolTile(
            icon: Icons.shield_outlined,
            title: 'Permission auditor',
            subtitle: 'Review 12 sensitive permission accesses.',
            onTap: () => context.go('/tools/privacy'),
          ),
          _ToolTile(
            icon: Icons.lock_outline,
            title: 'Safe Vault',
            subtitle: 'Encrypt files with passcode or biometrics.',
            onTap: () => context.go('/tools/vault'),
          ),
          const SizedBox(height: 24),
          SectionHeader(title: 'Cloud & Sharing'),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: const Icon(Icons.cloud_upload_outlined),
              title: const Text('Move files to cloud'),
              subtitle: const Text('Optional user-initiated transfers.'),
              trailing: FilledButton(onPressed: () {}, child: const Text('Connect')),
            ),
          ),
        ],
      ),
    );
  }
}

class _ToolTile extends StatelessWidget {
  const _ToolTile({required this.icon, required this.title, required this.subtitle, this.onTap});

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
