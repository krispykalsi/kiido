import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kiido/state/things_view_state.dart';
import 'package:kiido/ui/things/thing_image_banner.dart';
import 'package:kiido/ui/things/thing_specification_item.dart';
import 'package:kiido/ui/things/things_list_tile.dart';
import 'package:oxidized/oxidized.dart';

import '../../data/model/thing.dart';

class ThingDetailView extends ConsumerStatefulWidget {
  const ThingDetailView({Key? key}) : super(key: key);

  static const routeName = "detail";

  @override
  ConsumerState<ThingDetailView> createState() => _ThingDetailViewState();
}

class _ThingDetailViewState extends ConsumerState<ThingDetailView> {
  late Option<Thing> _thing;
  late List<Thing> _relatedThings;

  @override
  void initState() {
    super.initState();
    final thingsViewState = ref.read(ThingsViewState.provider);
    _thing = thingsViewState.thingInFocus;
    _relatedThings = thingsViewState.relatedThings;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _thing.when(
        some: (thing) => AppBar(title: Text(thing.name)),
        none: () => null,
      ),
      body: _thing.when(
        none: () => const Center(child: Text("Please select an item...")),
        some: (thing) {
          const itemSpacing = SizedBox(height: 12);
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding:
                const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 70),
            child: DefaultTextStyle(
              style: const TextStyle(fontSize: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 252, child: ThingImageBanner(thing)),
                  itemSpacing,
                  itemSpacing,
                  const Text(
                    "Specifications",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  itemSpacing,
                  ThingSpecificationItem(
                    heading: "Name",
                    detail: thing.name,
                  ),
                  ThingSpecificationItem(
                    heading: "Category",
                    detail: thing.category.name,
                  ),
                  ThingSpecificationItem(
                    heading: "Quantity",
                    detail: "${thing.quantity}",
                  ),
                  itemSpacing,
                  itemSpacing,
                  const Text(
                    "You may also like",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  itemSpacing,
                  ..._relatedThings
                      .map((relatedThing) => ThingsListTile(relatedThing))
                      .toList(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
