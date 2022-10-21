import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/model/thing.dart';

class ThingImageBanner extends StatelessWidget {
  const ThingImageBanner(this.thing, {Key? key}) : super(key: key);

  final Thing thing;

  @override
  Widget build(BuildContext context) {
    const padding = 15.0;
    const radius = Radius.circular(15);
    return Material(
      clipBehavior: Clip.hardEdge,
      borderRadius: const BorderRadius.only(topLeft: radius, topRight: radius),
      type: MaterialType.card,
      child: Stack(
        children: [
          Positioned.fill(
            child: CachedNetworkImage(
              imageUrl: thing.imageUrl,
              alignment: Alignment.center,
              fit: BoxFit.cover,
            ),
          ),
          const Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  stops: [0.3, 1],
                  colors: [Colors.transparent, Color(0xFF16181d)],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: padding,
            left: padding,
            child: DefaultTextStyle(
              style: const TextStyle(
                shadows: [
                  BoxShadow(
                    spreadRadius: 2,
                    blurRadius: 7,
                    color: Colors.black,
                  ),
                ],
                fontWeight: FontWeight.bold,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(thing.name, style: const TextStyle(fontSize: 18)),
                  Text(thing.category.name),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
