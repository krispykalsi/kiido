class Category {
  final BigInt id;
  final String name;
  final int numberOfThings;
  final String iconUrl;

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
    required this.iconUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'number_of_things': numberOfThings,
      'icon_url': iconUrl,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: BigInt.from(map['id']),
      name: map['name'] as String,
      numberOfThings: map['number_of_things'] as int,
      iconUrl: map['icon_url'] as String,
    );
  }
}
