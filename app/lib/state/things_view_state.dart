import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oxidized/oxidized.dart';

import '../data/model/thing.dart';
import '../data/repository.dart';
import 'categories_view_state.dart';
import 'things_view_notifier.dart';

class ThingsViewState {
  final AsyncValue<List<Thing>> things;
  final List<Thing> searchResults;
  final List<Thing> filteredThings;
  final bool isSearching;
  final Option<Thing> thingInFocus;

  static const initial = ThingsViewState(
    things: AsyncValue.loading(),
    thingInFocus: None(),
    searchResults: [],
    filteredThings: [],
    isSearching: false,
  );

  static final provider =
      StateNotifierProvider<ThingsViewNotifier, ThingsViewState>(
    (ref) {
      final notifier = ThingsViewNotifier(
        initial,
        ref.watch(Repository.provider),
      );
      ref.listen(
        CategoriesViewState.provider.select((state) => state.selectedCategory),
        (previous, next) {
          final selectedCategory = next.toNullable();
          if (selectedCategory != null) {
            notifier.filterThingsForCategory(selectedCategory);
          }
        },
      );
      return notifier;
    },
  );

  const ThingsViewState({
    required this.things,
    required this.searchResults,
    required this.filteredThings,
    required this.isSearching,
    required this.thingInFocus,
  });

  ThingsViewState copyWith({
    AsyncValue<List<Thing>>? things,
    List<Thing>? searchResults,
    List<Thing>? filteredThings,
    bool? isSearching,
    Option<Thing>? thingInFocus,
  }) {
    return ThingsViewState(
      things: things ?? this.things,
      searchResults: searchResults ?? this.searchResults,
      filteredThings: filteredThings ?? this.filteredThings,
      isSearching: isSearching ?? this.isSearching,
      thingInFocus: thingInFocus ?? this.thingInFocus,
    );
  }
}
