import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'things_list_tile.dart';
import '../../state/things_view_state.dart';
import '../common/loading_indicator.dart';

class ThingsView extends ConsumerWidget {
  const ThingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final things = ref.watch(
      ThingsViewState.provider.select((state) => state.things),
    );
    return Scaffold(
      appBar: AppBar(title: const Text("Things")),
      body: things.when(
        data: (things) {
          return ListView.separated(
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
