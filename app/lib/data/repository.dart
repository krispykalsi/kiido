import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'model/category.dart';
import 'model/thing.dart';

abstract class Repository {
  Future<List<Thing>> fetchThings();

  Future<List<Category>> fetchCategories();

  Future<List<Thing>> fetchThingsOfCategory(BigInt categoryId);

  static final provider = Provider((ref) => DummyRepository());
}

class DummyRepository implements Repository {
  @override
  Future<List<Category>> fetchCategories() async {
    return [];
  }

  @override
  Future<List<Thing>> fetchThings() async {
    return [];
  }

  @override
  Future<List<Thing>> fetchThingsOfCategory(BigInt categoryId) async {
    return [];
  }
}
