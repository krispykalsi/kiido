import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    final searchResults = ref.watch(
      ThingsViewState.provider.select((state) => state.searchResults),
    );
    final isSearching = ref.watch(
      ThingsViewState.provider.select((state) => state.isSearching),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Things"),
        actions: const [SearchSystem()],
      ),
      body: things.when(
        data: (things) {
          if (isSearching) things = searchResults;
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
