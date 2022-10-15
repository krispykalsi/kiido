import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kiido/state/tab_state.dart';

import 'things/things_view.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tab = ref.watch(TabState.provider);
    switch (tab) {
      case TabState.things:
        return const ThingsView();
      case TabState.categories:
        return const Center(child: Text("Categories"));
    }
  }
}
