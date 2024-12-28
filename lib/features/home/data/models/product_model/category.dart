class Category {
  int? id;
  String? name;
  String? image;
  dynamic creationAt;
  dynamic updatedAt;

  Category({
    this.id,
    this.name,
    this.image,
    this.creationAt,
    this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'] as int?,
        name: json['name'] as String?,
        image: json['image'] as String?,
        creationAt: json['creationAt'] == null
            ? null
            : json['creationAt'] as String,
        updatedAt: json['updatedAt'] == null
            ? null
            : json['updatedAt'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'creationAt': creationAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };
}
