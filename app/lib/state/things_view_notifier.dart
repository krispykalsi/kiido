import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    state = state.copyWith(thingInFocus: Option.some(thing));
  }

  void clearThingInFocus() {
    state = state.copyWith(thingInFocus: Option.none());
  }
}
