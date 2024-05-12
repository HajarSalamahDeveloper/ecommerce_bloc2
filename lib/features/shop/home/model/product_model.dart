import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final int? price;
  final double? discountPercentage;
  final double? rating;
  final int? stock;
  final String? brand;
  final String? category;
  final String? thumbnail;
  final List<String>? images;
  bool isFavorite;
  ProductModel({
    this.id,
    this.title,
    this.description,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
    this.images,
    this.isFavorite = false,
  });

  ProductModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        price = json['price'],
        discountPercentage = json['discountPercentage'],
        rating = json['rating'].toDouble(),
        stock = json['stock'],
        brand = json['brand'],
        category = json['category'],
        thumbnail = json['thumbnail'],
        images = json['images']?.cast<String>(),
        isFavorite = false;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['price'] = price;
    data['discountPercentage'] = discountPercentage;
    data['rating'] = rating;
    data['stock'] = stock;
    data['brand'] = brand;
    data['category'] = category;
    data['thumbnail'] = thumbnail;
    data['images'] = images;
    return data;
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        price,
        discountPercentage,
        rating,
        stock,
        brand,
        category,
        thumbnail,
        images,
        isFavorite
      ];
}
