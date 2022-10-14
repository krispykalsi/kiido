import 'category.dart';

class Thing {
  final BigInt id;
  final String name;
  final Category category;
  final int quantity;
  final String iconUrl;
  final String imageUrl;

  const Thing({
    required this.id,
    required this.name,
    required this.category,
    required this.quantity,
    required this.iconUrl,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'quantity': quantity,
      'iconUrl': iconUrl,
      'imageUrl': imageUrl,
    };
  }

  factory Thing.fromMap(Map<String, dynamic> map) {
    return Thing(
      id: map['id'] as BigInt,
      name: map['name'] as String,
      category: Category.fromMap(Map.from(map['category'])),
      quantity: map['quantity'] as int,
      iconUrl: map['iconUrl'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }
}
