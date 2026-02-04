import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = const [
      _OnboardPage(
        title: 'Welcome to CleanFlow',
        description: 'Privacy-first cleaner built for safe, local scans.',
        icon: Icons.auto_fix_high,
      ),
      _OnboardPage(
        title: 'Protect your storage',
        description: 'Find junk, duplicates, and large files with 1 tap.',
        icon: Icons.storage_outlined,
      ),
      _OnboardPage(
        title: 'Own your privacy',
        description: 'Audit permissions and encrypt files in Safe Vault.',
        icon: Icons.shield_outlined,
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: pages.length,
                  itemBuilder: (context, index) => pages[index],
                ),
              ),
              FilledButton(
                onPressed: () => context.go('/'),
                child: const Text('Get started'),
              ),
              const SizedBox(height: 12),
              TextButton(onPressed: () => context.go('/'), child: const Text('Skip')),
            ],
          ),
        ),
      ),
    );
  }
}

class _OnboardPage extends StatelessWidget {
  const _OnboardPage({required this.title, required this.description, required this.icon});

  final String title;
  final String description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 48,
          backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          child: Icon(icon, size: 48, color: Theme.of(context).colorScheme.primary),
        ),
        const SizedBox(height: 24),
        Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
        const SizedBox(height: 12),
        Text(description, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
      ],
    );
  }
}
