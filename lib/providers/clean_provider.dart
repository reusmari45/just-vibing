import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/app_models.dart';

class CleanState {
  const CleanState({
    required this.progress,
    required this.isCleaning,
    required this.freedMb,
    required this.undoAvailable,
    required this.logs,
  });

  final double progress;
  final bool isCleaning;
  final double freedMb;
  final bool undoAvailable;
  final List<CleanupLogEntry> logs;

  CleanState copyWith({
    double? progress,
    bool? isCleaning,
    double? freedMb,
    bool? undoAvailable,
    List<CleanupLogEntry>? logs,
  }) {
    return CleanState(
      progress: progress ?? this.progress,
      isCleaning: isCleaning ?? this.isCleaning,
      freedMb: freedMb ?? this.freedMb,
      undoAvailable: undoAvailable ?? this.undoAvailable,
      logs: logs ?? this.logs,
    );
  }

  static CleanState initial() {
    return const CleanState(
      progress: 0,
      isCleaning: false,
      freedMb: 0,
      undoAvailable: false,
      logs: [
        CleanupLogEntry(timestamp: 'Today 2:00 AM', freedMb: 840, itemsRemoved: 1240),
        CleanupLogEntry(timestamp: 'Yesterday 2:00 AM', freedMb: 620, itemsRemoved: 980),
      ],
    );
  }
}

class CleanController extends StateNotifier<CleanState> {
  CleanController() : super(CleanState.initial());

  Timer? _timer;

  void startClean() {
    if (state.isCleaning) {
      return;
    }
    state = state.copyWith(progress: 0, isCleaning: true, undoAvailable: false);
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 180), (timer) {
      final next = state.progress + 0.08;
      if (next >= 1) {
        timer.cancel();
        final freed = 1640;
        state = state.copyWith(
          progress: 1,
          isCleaning: false,
          freedMb: freed.toDouble(),
          undoAvailable: true,
          logs: [
            CleanupLogEntry(timestamp: 'Just now', freedMb: freed.toDouble(), itemsRemoved: 1450),
            ...state.logs,
          ],
        );
      } else {
        state = state.copyWith(progress: next);
      }
    });
  }

  void useUndo() {
    if (!state.undoAvailable) {
      return;
    }
    state = state.copyWith(undoAvailable: false, freedMb: 0);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

final cleanControllerProvider = StateNotifierProvider<CleanController, CleanState>((ref) {
  final controller = CleanController();
  ref.onDispose(controller.dispose);
  return controller;
});
