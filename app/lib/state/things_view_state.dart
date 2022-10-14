import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/model/thing.dart';
import '../data/repository.dart';
import 'things_view_notifier.dart';

class ThingsViewState {
  final AsyncValue<List<Thing>> things;

  static const initial = ThingsViewState(
    things: AsyncValue.loading(),
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
  });

  ThingsViewState copyWith({
    AsyncValue<List<Thing>>? things,
  }) {
    return ThingsViewState(
      things: things ?? this.things,
    );
  }
}
