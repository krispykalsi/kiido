import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/categories_view_state.dart';
import '../../state/tab_state.dart';
import 'search_system.dart';
import 'things_list_tile.dart';
import '../../state/things_view_state.dart';
import '../common/loading_indicator.dart';

class ThingsView extends ConsumerWidget {
  const ThingsView({Key? key}) : super(key: key);

  static const routeName = "things";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final things = ref.watch(
      ThingsViewState.provider.select((state) => state.things),
    );
    final isSearching = ref.watch(
      ThingsViewState.provider.select((state) => state.isSearching),
    );
    final isCategoryTab = ref.watch(TabState.provider) == TabState.categories;
    var appBarTitle = "Things";
    if (isCategoryTab) {
      appBarTitle = ref.watch(
        CategoriesViewState.provider.select(
          (state) =>
              state.selectedCategory.mapOr((category) => category.name, ""),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        actions: [if (!isCategoryTab) const SearchSystem()],
      ),
      body: things.when(
        data: (things) {
          if (isSearching) {
            things = ref.watch(
              ThingsViewState.provider.select((state) => state.searchResults),
            );
          } else if (isCategoryTab) {
            things = ref.watch(
              ThingsViewState.provider.select((state) => state.filteredThings),
            );
          }
          return ListView.separated(
            clipBehavior: Clip.none,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemBuilder: (context, index) => ThingsListTile(things[index]),
            separatorBuilder: (context, index) => const SizedBox(height: 0),
            itemCount: things.length,
          );
        },
        error: (e, s) => Center(child: Text(e.toString())),
        loading: () => const LoadingIndicator(),
      ),
    );
  }
}
