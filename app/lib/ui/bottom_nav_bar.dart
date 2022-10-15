import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kiido/state/tab_state.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabState = ref.watch(TabState.provider);
    const blur = 4.5;
    return ClipRect(
      child: SizedBox(
        height: 60,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: BottomNavigationBar(
            fixedColor: Colors.amber,
            backgroundColor: Colors.black.withOpacity(0.7),
            currentIndex: tabState.index,
            items: TabState.values.map((tab) => tab.barItem).toList(),
            onTap: (index) {
              ref.read(TabState.provider.notifier).state = TabState.values[index];
            },
          ),
        ),
      ),
    );
  }
}
