import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kiido/state/things_view_state.dart';
import '../../data/model/thing.dart';

class ThingsListTile extends ConsumerWidget {
  const ThingsListTile(this.thing, {Key? key}) : super(key: key);

  final Thing thing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      visualDensity: VisualDensity.compact,
      leading: CircleAvatar(
        foregroundImage: NetworkImage(thing.iconUrl),
        backgroundColor:
            HSLColor.fromColor(Colors.amber).withLightness(0.3).toColor(),
        child: Center(
          child: Text(
            thing.name[0],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      onTap: () {
        ref.read(ThingsViewState.provider.notifier).bringThingInFocus(thing);
      },
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      title: Text(thing.name),
      subtitle: Text(thing.category.name),
    );
  }
}
