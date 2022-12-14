import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kiido/state/things_view_state.dart';
import '../../data/model/thing.dart';
import 'thing_detail_view.dart';

class ThingsListTile extends ConsumerWidget {
  const ThingsListTile(this.thing, {Key? key}) : super(key: key);

  final Thing thing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: CircleAvatar(
        radius: 26,
        foregroundImage: CachedNetworkImageProvider(thing.iconUrl),
        backgroundColor:
            HSLColor.fromColor(Colors.amber).withLightness(0.5).toColor(),
        child: Center(
          child: Text(
            thing.name.isNotEmpty ? thing.name[0] : "",
            style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
          ),
        ),
      ),
      onTap: () {
        ref.read(ThingsViewState.provider.notifier).bringThingInFocus(thing);
        Navigator.of(context).pushNamed(ThingDetailView.routeName);
      },
      contentPadding: EdgeInsets.zero,
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      title: Text(
        thing.name,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      subtitle: Text(
        thing.category.name,
        style: const TextStyle(color: Colors.grey, fontSize: 18),
      ),
    );
  }
}
