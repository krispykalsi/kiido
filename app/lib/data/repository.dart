import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import 'azure_repository.dart';
import 'model/category.dart';
import 'model/thing.dart';

abstract class Repository {
  Future<List<Thing>> fetchThings();

  Future<List<Category>> fetchCategories();

  Future<List<Thing>> fetchThingsOfCategory(BigInt categoryId);

  static final provider = Provider((ref) {
    final client = http.Client();
    ref.onDispose(client.close);
    return AzureRepository(client);
  });
}
