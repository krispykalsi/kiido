import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/model/category.dart';

class CategoriesGridTile extends StatelessWidget {
  const CategoriesGridTile(this.category, {Key? key}) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
