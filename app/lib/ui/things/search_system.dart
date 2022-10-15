import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kiido/state/things_view_state.dart';

class SearchSystem extends ConsumerWidget {
  const SearchSystem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, ref, child) {
        final isSearching = ref.watch(
          ThingsViewState.provider.select((state) => state.isSearching),
        );
        const padding = 12.0;
        return isSearching
            ? Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: padding,
                          top: padding,
                          bottom: padding,
                        ),
                        child: Material(
                          clipBehavior: Clip.hardEdge,
                          borderRadius: BorderRadius.circular(15),
                          color: HSLColor.fromColor(Colors.amber)
                              .withLightness(0.42)
                              .toColor(),
                          child: TextField(
                            onChanged: ref
                                .read(ThingsViewState.provider.notifier)
                                .filterThingsFor,
                            style: const TextStyle(color: Colors.black),
                            cursorColor: Colors.black,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                              enabledBorder: InputBorder.none,
                              border: InputBorder.none,
                              hintText: "Search",
                              hintStyle: TextStyle(color: Colors.black38),
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: ref
                          .read(ThingsViewState.provider.notifier)
                          .exitSearch,
                      icon: const Icon(Icons.cancel),
                    ),
                  ],
                ),
              )
            : IconButton(
                onPressed:
                    ref.read(ThingsViewState.provider.notifier).enterSearch,
                icon: const Icon(Icons.search),
              );
      },
    );
  }
}
