import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kiido/data/model/category.dart';
import 'package:oxidized/oxidized.dart';

import '../data/model/thing.dart';
import '../data/repository.dart';
import 'things_view_state.dart';

class ThingsViewNotifier extends StateNotifier<ThingsViewState> {
  ThingsViewNotifier(super.state, this._repository) {
    loadThings();
  }

  final Repository _repository;

  Future<void> loadThings() async {
    state = state.copyWith(things: const AsyncValue.loading());
    final newThings = await AsyncValue.guard(_repository.fetchThings);
    state = state.copyWith(things: newThings);
  }

  void bringThingInFocus(Thing thing) {
    final thingsOfSameCategory =
        state.things.value?.where((t) => t.category == thing.category) ?? [];
    final randomSameCategoryThings = <Thing>[];
    final random = Random();
    for (var i = 0; i < 3 && i < thingsOfSameCategory.length; i++) {
      final randomIdx = random.nextInt(thingsOfSameCategory.length);
      final randomThing = thingsOfSameCategory.elementAt(randomIdx);
      if (randomThing.id == thing.id) continue;
      randomSameCategoryThings.add(randomThing);
    }
    state = state.copyWith(
      thingInFocus: Option.some(thing),
      relatedThings: randomSameCategoryThings,
    );
  }

  void enterSearch() => state = state.copyWith(isSearching: true);

  void exitSearch() => state = state.copyWith(isSearching: false);

  void filterThingsForCategory(Category category) {
    final things = state.things.maybeWhen(
      data: (things) => things,
      orElse: () => <Thing>[],
    );
    final filteredThings =
        things.where((thing) => thing.category == category).toList();
    state = state.copyWith(filteredThings: filteredThings);
  }

  void filterThingsForSearchText(String searchText) {
    final things = state.things.maybeWhen(
      data: (things) => things,
      orElse: () => <Thing>[],
    );
    String searchRegexString = "";
    for (var i = 0; i < searchText.length; i++) {
      searchRegexString += "${searchText[i]}.*";
    }
    final searchRegexp = RegExp(searchRegexString, caseSensitive: false);
    final filteredThings = things
        .where(
          (thing) =>
              searchRegexp.hasMatch(thing.name) ||
              searchRegexp.hasMatch(thing.category.name),
        )
        .toList();
    state = state.copyWith(searchResults: filteredThings);
  }
}
