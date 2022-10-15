import 'package:flutter/material.dart';
import '../../data/model/thing.dart';

class ThingsListTile extends StatelessWidget {
  const ThingsListTile(this.thing, {Key? key}) : super(key: key);

  final Thing thing;

  @override
  Widget build(BuildContext context) {
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
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      title: Text(thing.name),
      subtitle: Text(thing.category.name),
    );
  }
}
