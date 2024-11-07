import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/subcategory_entity.dart';

class SubCategoryModel extends SubCategoryEntity {
  const SubCategoryModel({
    required super.id,
    required super.categoryId,
    required super.subCategoryName,
  });

  // Factory method to create a SubCategoryModel from JSON
  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      id: json['id'],
      categoryId: json['category_id'],
      subCategoryName: json['sub_category_name'],
    );
  }

  // Method to convert a SubCategoryModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category_id': categoryId,
      'sub_category_name': subCategoryName,
    };
  }
}
