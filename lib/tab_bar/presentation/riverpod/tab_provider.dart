import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// TabControllerNotifier
class TabControllerNotifier extends StateNotifier<TabController?> {
  final TickerProvider tickerProvider;
  final int tabCount;

  TabControllerNotifier({
    required this.tickerProvider,
    this.tabCount = 3,
  }) : super(null) {
    // Initialize TabController
    state = TabController(
      vsync: tickerProvider,
      length: tabCount,
    );
  }

  /// Change tabs programmatically
  void changeTab(int index) {
    state?.animateTo(index);
  }

  @override
  void dispose() {
    state?.dispose();
    super.dispose();
  }
}

/// Global TabController Provider
final tabControllerProvider = StateNotifierProvider.family<
    TabControllerNotifier, TabController?, TickerProvider>(
  (ref, tickerProvider) => TabControllerNotifier(
    tickerProvider: tickerProvider,
    tabCount: 3,
  ),
);
