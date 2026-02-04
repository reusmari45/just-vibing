import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CleanFlowScaffold extends StatelessWidget {
  const CleanFlowScaffold({super.key, required this.child});

  final Widget child;

  int _locationToIndex(String location) {
    if (location.startsWith('/storage')) {
      return 1;
    }
    if (location.startsWith('/clean')) {
      return 2;
    }
    if (location.startsWith('/tools')) {
      return 3;
    }
    return 0;
  }

  void _onTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/storage');
        break;
      case 2:
        context.go('/clean');
        break;
      case 3:
        context.go('/tools');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    return Scaffold(
      body: child,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _onTap(context, 2),
        icon: const Icon(Icons.auto_fix_high),
        label: const Text('One-tap clean'),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _locationToIndex(location),
        onDestinationSelected: (index) => _onTap(context, index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.pie_chart_outline), label: 'Storage'),
          NavigationDestination(icon: Icon(Icons.cleaning_services_outlined), label: 'Clean'),
          NavigationDestination(icon: Icon(Icons.tune_outlined), label: 'Tools'),
        ],
      ),
    );
  }
}
