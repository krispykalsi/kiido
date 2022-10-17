import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kiido/data/model/category.dart';
import 'package:oxidized/oxidized.dart';

import '../data/repository.dart';
import 'categories_view_state.dart';

class CategoriesViewNotifier extends StateNotifier<CategoriesViewState> {
  CategoriesViewNotifier(super.state, this._repository) {
    loadCategories();
  }

  final Repository _repository;

  Future<void> loadCategories() async {
    state = state.copyWith(categories: const AsyncValue.loading());
    final c = await AsyncValue.guard(_repository.fetchCategories);
    state = state.copyWith(categories: c);
  }

  void selectCategory(Category category) =>
      state = state.copyWith(selectedCategory: Option.some(category));
}
