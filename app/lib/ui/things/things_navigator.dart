import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/slide_transition_builder.dart';
import 'thing_detail_view.dart';
import 'things_view.dart';

class ThingsNavigator extends ConsumerStatefulWidget {
  const ThingsNavigator({Key? key}) : super(key: key);

  static const routeName = "things";

  @override
  ConsumerState<ThingsNavigator> createState() => _ThingsTabState();
}

class _ThingsTabState extends ConsumerState<ThingsNavigator> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !await _navigatorKey.currentState!.maybePop(),
      child: Navigator(
        key: _navigatorKey,
        initialRoute: ThingsView.routeName,
        onGenerateRoute: (settings) {
          Widget view;
          switch (settings.name) {
            case ThingsView.routeName:
              view = const ThingsView();
              break;
            case ThingDetailView.routeName:
              view = const ThingDetailView();
              break;
            default:
              throw "Invalid route in Things tab: ${settings.name}";
          }
          return PageRouteBuilder(
            pageBuilder: (_, __, ___) => view,
            transitionsBuilder: slideTransitionBuilder,
            transitionDuration: pageTransitionDuration,
            reverseTransitionDuration: pageTransitionDuration,
            settings: settings,
          );
        },
      ),
    );
  }
}
