import 'package:flutter_riverpod/flutter_riverpod.dart';

enum TabState {
  things,
  categories;

  static final provider = StateProvider((ref) => TabState.things);
}
