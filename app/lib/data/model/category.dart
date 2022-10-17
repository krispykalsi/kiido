class Category {
  final BigInt id;
  final String name;
  final int numberOfThings;
  final String imageUrl;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Category && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  const Category({
    required this.id,
    required this.name,
    required this.numberOfThings,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'numberOfThings': numberOfThings,
      'imageUrl': imageUrl,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] as BigInt,
      name: map['name'] as String,
      numberOfThings: map['numberOfThings'] as int,
      imageUrl: map['imageUrl'] as String,
    );
  }
}
