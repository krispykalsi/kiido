import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repository.dart';
import 'things_view_state.dart';

class ThingsViewNotifier extends StateNotifier<ThingsViewState> {
  ThingsViewNotifier(super.state, this._repository);

  final Repository _repository;

  Future<void> loadThings() async {
    state = state.copyWith(things: const AsyncValue.loading());
    final newThings = await AsyncValue.guard(_repository.fetchThings);
    state = state.copyWith(things: newThings);
  }
}
