import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kiido/data/repository.dart';
import 'package:kiido/state/categories_view_notifier.dart';

import '../data/model/category.dart';

class CategoriesViewState {
  final AsyncValue<List<Category>> categories;

  static const initial = CategoriesViewState(
    categories: AsyncValue.loading(),
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
  });

  CategoriesViewState copyWith({
    AsyncValue<List<Category>>? categories,
  }) {
    return CategoriesViewState(
      categories: categories ?? this.categories,
    );
  }
}
