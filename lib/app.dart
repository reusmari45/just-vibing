import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'core/theme.dart';
import 'features/clean/clean_screen.dart';
import 'features/duplicates/duplicates_screen.dart';
import 'features/home/home_screen.dart';
import 'features/onboarding/onboarding_screen.dart';
import 'features/storage/storage_screen.dart';
import 'features/tools/tools_screen.dart';
import 'features/apps/app_manager_screen.dart';
import 'features/battery/battery_screen.dart';
import 'features/privacy/privacy_screen.dart';
import 'features/vault/vault_screen.dart';
import 'widgets/cleanflow_scaffold.dart';

class CleanFlowApp extends StatelessWidget {
  const CleanFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'CleanFlow',
      debugShowCheckedModeBanner: false,
      theme: CleanFlowTheme.lightTheme,
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    ShellRoute(
      builder: (context, state, child) => CleanFlowScaffold(child: child),
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/storage',
          builder: (context, state) => const StorageScreen(),
        ),
        GoRoute(
          path: '/clean',
          builder: (context, state) => const CleanScreen(),
        ),
        GoRoute(
          path: '/tools',
          builder: (context, state) => const ToolsScreen(),
        ),
        GoRoute(
          path: '/tools/duplicates',
          builder: (context, state) => const DuplicatesScreen(),
        ),
        GoRoute(
          path: '/tools/vault',
          builder: (context, state) => const VaultScreen(),
        ),
        GoRoute(
          path: '/tools/privacy',
          builder: (context, state) => const PrivacyScreen(),
        ),
        GoRoute(
          path: '/tools/apps',
          builder: (context, state) => const AppManagerScreen(),
        ),
        GoRoute(
          path: '/tools/battery',
          builder: (context, state) => const BatteryScreen(),
        ),
      ],
    ),
  ],
);
