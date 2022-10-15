import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/tab_state.dart';
import 'things/things_tab.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabState = ref.watch(TabState.provider);
    switch (tabState) {
      case TabState.things:
        return const ThingsTab();
      case TabState.categories:
        return const Center(child: Text("Categories"));
    }
  }
}
