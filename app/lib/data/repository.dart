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
    return [
      // for (var i = 0; i < 12; i++)
      Thing(
        // id: BigInt.from(i),
        id: BigInt.from(1),
        name: "Blocko",
        category: Category(
          id: BigInt.from(1),
          name: "Blocks",
          numberOfThings: 9,
          imageUrl:
              "https://res.cloudinary.com/glide/image/fetch/f_auto,w_450,h_450,c_lfill/https%3A%2F%2Fstorage.googleapis.com%2Fglide-prod.appspot.com%2Fuploads-v2%2Fdx21F6MgfgcwM1J0KM0g%2Fpub%2F0dHxTp8kZNp6KAMHhX7f.png",
        ),
        quantity: 17,
        // iconUrl: "",
        iconUrl:
            "https://res.cloudinary.com/glide/image/fetch/t_media_lib_thumb/https%3A%2F%2Fstorage.googleapis.com%2Fglide-prod.appspot.com%2Fuploads-v2%2Fdx21F6MgfgcwM1J0KM0g%2Fpub%2FA08a20Js5DeKZPppaTWs.jpg",
        imageUrl:
            "https://res.cloudinary.com/glide/image/fetch/f_auto,w_975,h_610,c_lfill/https%3A%2F%2Fstorage.googleapis.com%2Fglide-prod.appspot.com%2Fuploads-v2%2Fdx21F6MgfgcwM1J0KM0g%2Fpub%2FA08a20Js5DeKZPppaTWs.jpg",
      ),
      Thing(
        id: BigInt.from(2),
        name: "Brixo",
        category: Category(
          id: BigInt.from(2),
          name: "Clouds",
          numberOfThings: 5,
          imageUrl:
          "https://res.cloudinary.com/glide/image/fetch/f_auto,w_450,h_450,c_lfill/https%3A%2F%2Fstorage.googleapis.com%2Fglide-prod.appspot.com%2Fuploads-v2%2Fdx21F6MgfgcwM1J0KM0g%2Fpub%2F0dHxTp8kZNp6KAMHhX7f.png",
        ),
        quantity: 95,
        iconUrl: "",
        // iconUrl:
        //     "https://res.cloudinary.com/glide/image/fetch/t_media_lib_thumb/https%3A%2F%2Fstorage.googleapis.com%2Fglide-prod.appspot.com%2Fuploads-v2%2Fdx21F6MgfgcwM1J0KM0g%2Fpub%2FA08a20Js5DeKZPppaTWs.jpg",
        imageUrl:
        "https://res.cloudinary.com/glide/image/fetch/f_auto,w_975,h_610,c_lfill/https%3A%2F%2Fstorage.googleapis.com%2Fglide-prod.appspot.com%2Fuploads-v2%2Fdx21F6MgfgcwM1J0KM0g%2Fpub%2FA08a20Js5DeKZPppaTWs.jpg",
      )
    ];
  }

  @override
  Future<List<Thing>> fetchThingsOfCategory(BigInt categoryId) async {
    return [];
  }
}
