import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/tab_state.dart';
import 'bottom_nav_bar.dart';
import 'categories/category_navigator.dart';
import 'things/things_navigator.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabState = ref.watch(TabState.provider);
    late Widget tab;
    switch (tabState) {
      case TabState.things:
        tab = const ThingsNavigator();
        break;
      case TabState.categories:
        tab = const CategoriesNavigator();
        break;
    }
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        tab,
        const BottomNavBar(),
      ],
    );
  }
}
