import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model/category.dart';
import 'model/thing.dart';
import 'repository.dart';

class AzureRepository implements Repository {
  AzureRepository(this._client);

  final http.Client _client;

  static final _baseUrl = Uri.parse(
    "http://calcul-kiido-api.hgcuazfneghjeyev.centralindia.azurecontainer.io:5858",
  );

  _decodeResponse(http.Response res) {
    if (!res.statusCode.toString().startsWith("2")) {
      throw "code: ${res.statusCode}\nbody: ${res.body}";
    }
    return jsonDecode(utf8.decode(res.bodyBytes));
  }

  @override
  Future<List<Category>> fetchCategories() async {
    final uri = _baseUrl.resolve("/categories");
    final res = await _client.get(uri);
    var decodedResponse = _decodeResponse(res) as Iterable;
    return decodedResponse
        .map((categoryJson) => Category.fromMap(Map.from(categoryJson)))
        .toList();
  }

  @override
  Future<List<Thing>> fetchThings() async {
    final uri = _baseUrl.resolve("/things");
    final res = await _client.get(uri);
    var decodedResponse = _decodeResponse(res) as Iterable;
    return decodedResponse
        .map((thingJson) => Thing.fromMap(Map.from(thingJson)))
        .toList();
  }

  @override
  Future<List<Thing>> fetchThingsOfCategory(BigInt categoryId) async {
    final uri = _baseUrl.resolve("/things?category=$categoryId");
    final res = await _client.get(uri);
    final decodedResponse = _decodeResponse(res) as Iterable;
    return decodedResponse
        .map((thingJson) => Thing.fromMap(Map.from(thingJson)))
        .toList();
  }
}
