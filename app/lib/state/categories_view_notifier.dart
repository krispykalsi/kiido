import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repository.dart';
import 'categories_view_state.dart';

class CategoriesViewNotifier extends StateNotifier<CategoriesViewState> {
  CategoriesViewNotifier(super.state, this._repository) {
    loadThings();
  }

  final Repository _repository;

  Future<void> loadThings() async {
    state = state.copyWith(categories: const AsyncValue.loading());
    final c = await AsyncValue.guard(_repository.fetchCategories);
    state = state.copyWith(categories: c);
  }
}
