import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kiido/state/categories_view_state.dart';
import 'package:kiido/ui/things/things_navigator.dart';

import '../../data/model/category.dart';

class CategoriesGridTile extends ConsumerWidget {
  const CategoriesGridTile(this.category, {Key? key}) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        final notifier = ref.read(CategoriesViewState.provider.notifier);
        notifier.selectCategory(category);
        Navigator.of(context).pushNamed(ThingsNavigator.routeName);
      },
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: AspectRatio(
                aspectRatio: 1,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(category.imageUrl),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              category.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "${category.numberOfThings} things",
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
