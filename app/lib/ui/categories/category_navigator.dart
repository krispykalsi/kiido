import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kiido/ui/common/slide_transition_builder.dart';
import 'package:kiido/ui/things/things_view.dart';

import '../things/thing_detail_view.dart';
import 'categories_view.dart';

class CategoriesNavigator extends ConsumerStatefulWidget {
  const CategoriesNavigator({Key? key}) : super(key: key);

  @override
  ConsumerState<CategoriesNavigator> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends ConsumerState<CategoriesNavigator> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !await _navigatorKey.currentState!.maybePop(),
      child: Navigator(
        key: _navigatorKey,
        initialRoute: CategoriesView.routeName,
        onGenerateRoute: (settings) {
          Widget view;
          switch (settings.name) {
            case CategoriesView.routeName:
              view = const CategoriesView();
              break;
            case ThingsView.routeName:
              view = const ThingsView();
              break;
            case ThingDetailView.routeName:
              view = const ThingDetailView();
              break;
            default:
              throw "Invalid route in Categories tab: ${settings.name}";
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
