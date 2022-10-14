import 'model/category.dart';
import 'model/thing.dart';

abstract class Repository {
  Future<List<Thing>> fetchThings();

  Future<List<Category>> fetchCategories();

  Future<List<Thing>> fetchThingsOfCategory(BigInt categoryId);
}
