import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oxidized/oxidized.dart';

import '../data/model/category.dart';
import '../data/repository.dart';
import 'categories_view_notifier.dart';

class CategoriesViewState {
  final AsyncValue<List<Category>> categories;
  final Option<Category> selectedCategory;

  static const initial = CategoriesViewState(
    categories: AsyncValue.loading(),
    selectedCategory: None(),
  );

  static final provider =
      StateNotifierProvider<CategoriesViewNotifier, CategoriesViewState>(
    (ref) => CategoriesViewNotifier(
      initial,
      ref.watch(Repository.provider),
    ),
  );

  const CategoriesViewState({
    required this.categories,
    required this.selectedCategory,
  });

  CategoriesViewState copyWith({
    AsyncValue<List<Category>>? categories,
    Option<Category>? selectedCategory,
  }) {
    return CategoriesViewState(
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}
