// Root Page to Initialize TabController
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gobal_tab_bar_with_riverpod/tab_bar/presentation/riverpod/tab_provider.dart';
part '../widgets/gobal_change_tab_button.dart';

class TabPage extends ConsumerStatefulWidget {
  const TabPage({super.key});

  @override
  ConsumerState<TabPage> createState() => _RootPageState();
}

class _RootPageState extends ConsumerState<TabPage>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // Initialize TabController
    ref.read(tabControllerProvider(this).notifier);
  }

  @override
  Widget build(BuildContext context) {
    final tabController = ref.watch(tabControllerProvider(this));
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabBar with Custom Widgets'),
        bottom: tabController == null
            ? null
            : TabBar(
                controller: tabController,
                tabs: const [
                  Tab(text: "Tab 1"),
                  Tab(text: "Tab 2"),
                  Tab(text: "Tab 3"),
                ],
              ),
      ),
      body: Column(
        children: [
          Expanded(
            child: tabController == null
                ? const Center(child: CircularProgressIndicator())
                : TabBarView(
                    controller: tabController,
                    children: const [
                      Center(child: Text("Content 1")),
                      Center(child: Text("Content 2")),
                      Center(child: Text("Content 3")),
                    ],
                  ),
          ),
          const Divider(),
          // Custom Buttons to Change Tabs
          Row(
            children: [
              _GobalChangeTabButton(
                onPressed: () {
                  ref.read(tabControllerProvider(this).notifier).changeTab(0);
                },
                buttionText: 'Go to Tab 1',
              ),
              _GobalChangeTabButton(
                onPressed: () {
                  ref.read(tabControllerProvider(this).notifier).changeTab(1);
                },
                buttionText: 'Go to Tab 2',
              ),
              _GobalChangeTabButton(
                onPressed: () {
                  ref.read(tabControllerProvider(this).notifier).changeTab(2);
                },
                buttionText: 'Go to Tab 3',
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Dispose of the TabController
    ref.read(tabControllerProvider(this).notifier).dispose();
    super.dispose();
  }
}
