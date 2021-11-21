class Thing {
  final String id;
  final String? name;
  final List? categories;
  final String? image;
  final int? stock;
  final String? location;

  Thing({
    required this.id,
    this.name,
    this.categories,
    this.image,
    this.stock,
    this.location,
  });

  factory Thing.fromJson(dynamic json) {
    return Thing(
      id: json['id'] as String,
      name: json['name'] as String,
      categories: json['categories'] as List,
      image: json['image'] as String,
      stock: json['stock'] as int,
      location: json['location'] as String?,
    );
  }

  static List<Thing> thingsFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Thing.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return "Thing { name: $name }";
  }
}
