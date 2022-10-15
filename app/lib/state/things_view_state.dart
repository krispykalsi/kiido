import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oxidized/oxidized.dart';

import '../data/model/thing.dart';
import '../data/repository.dart';
import 'things_view_notifier.dart';

class ThingsViewState {
  final AsyncValue<List<Thing>> things;
  final Option<Thing> thingInFocus;

  static const initial = ThingsViewState(
    things: AsyncValue.loading(),
    thingInFocus: None(),
  );

  static final provider =
      StateNotifierProvider<ThingsViewNotifier, ThingsViewState>(
    (ref) => ThingsViewNotifier(
      initial,
      ref.watch(Repository.provider),
    ),
  );

  const ThingsViewState({
    required this.things,
    required this.thingInFocus,
  });

  ThingsViewState copyWith({
    AsyncValue<List<Thing>>? things,
    Option<Thing>? thingInFocus,
  }) {
    return ThingsViewState(
      things: things ?? this.things,
      thingInFocus: thingInFocus ?? this.thingInFocus,
    );
  }
}
