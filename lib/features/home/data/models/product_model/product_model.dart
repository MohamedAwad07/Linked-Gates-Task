import 'package:linkedgates_task/features/home/domain/entities/product_entity.dart';

import 'category.dart';

class ProductModel extends ProductEntity {
  int? id;
  String? title;
  int? price;
  String? description;
  List<String>? images;
  DateTime? creationAt;
  DateTime? updatedAt;
  Category? category;

  ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.images,
    this.creationAt,
    this.updatedAt,
    this.category,
  }) : super(
          name: title ?? 'Unknown',
          productPrice: price ?? 0,
          imageURL: images?.first ?? '',
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'] as int?,
        title: json['title'] as String?,
        price: json['price'] as int?,
        description: json['description'] as String?,
        images: json['images'] as List<String>?,
        creationAt: json['creationAt'] == null ? null : DateTime.parse(json['creationAt'] as String),
        updatedAt: json['updatedAt'] == null ? null : DateTime.parse(json['updatedAt'] as String),
        category: json['category'] == null ? null : Category.fromJson(json['category'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': productPrice,
        'description': description,
        'images': images,
        'creationAt': creationAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'category': category?.toJson(),
      };
}
