import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kiido/state/things_view_state.dart';
import 'package:kiido/ui/things/thing_image_banner.dart';
import 'package:kiido/ui/things/thing_specification_item.dart';

class ThingDetailView extends ConsumerWidget {
  const ThingDetailView({Key? key}) : super(key: key);

  static const routeName = "detail";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final thing = ref.watch(
      ThingsViewState.provider.select((state) => state.thingInFocus),
    );
    return Scaffold(
      appBar: thing.when(
        some: (thing) => AppBar(title: Text(thing.name)),
        none: () => null,
      ),
      body: thing.when(
        some: (thing) {
          const itemSpacing = SizedBox(height: 8);
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: DefaultTextStyle(
              style: const TextStyle(fontSize: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 252,
                    child: ThingImageBanner(thing),
                  ),
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
                ],
              ),
            ),
          );
        },
        none: () => const Center(child: Text("Please select an item...")),
      ),
    );
  }
}
