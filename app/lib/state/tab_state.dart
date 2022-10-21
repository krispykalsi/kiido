import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum TabState {
  things(
    BottomNavigationBarItem(icon: Icon(Icons.apps), label: "Things"),
  ),
  categories(
    BottomNavigationBarItem(icon: Icon(Icons.folder), label: "Categories"),
  );

  final BottomNavigationBarItem barItem;

  const TabState(this.barItem);

  static final provider = StateProvider((ref) => TabState.things);
}
