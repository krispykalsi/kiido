import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oxidized/oxidized.dart';

import '../data/model/thing.dart';
import '../data/repository.dart';
import 'things_view_notifier.dart';

class ThingsViewState {
  final AsyncValue<List<Thing>> things;
  final List<Thing> searchResults;
  final bool isSearching;
  final Option<Thing> thingInFocus;

  static const initial = ThingsViewState(
    things: AsyncValue.loading(),
    thingInFocus: None(),
    searchResults: [],
    isSearching: false,
  );

  static final provider =
      StateNotifierProvider<ThingsViewNotifier, ThingsViewState>(
    (ref) => ThingsViewNotifier(
      initial,
      ref.watch(Repository.provider),
    ),
  );

  const ThingsViewState({
    required this.things,
    required this.searchResults,
    required this.isSearching,
    required this.thingInFocus,
  });

  ThingsViewState copyWith({
    AsyncValue<List<Thing>>? things,
    List<Thing>? searchResults,
    bool? isSearching,
    Option<Thing>? thingInFocus,
  }) {
    return ThingsViewState(
      things: things ?? this.things,
      searchResults: searchResults ?? this.searchResults,
      isSearching: isSearching ?? this.isSearching,
      thingInFocus: thingInFocus ?? this.thingInFocus,
    );
  }
}
