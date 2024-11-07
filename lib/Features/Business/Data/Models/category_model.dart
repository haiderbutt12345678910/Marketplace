import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    super.id,
    super.categoryName,
    super.thumbnail,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      categoryName: json['category_name'],
      thumbnail: json['thumbnail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category_name': categoryName,
      'thumbnail': thumbnail,
    };
  }
}
