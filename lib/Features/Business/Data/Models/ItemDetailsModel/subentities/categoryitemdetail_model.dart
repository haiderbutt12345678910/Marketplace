import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/ItemDetailsEntity/subentities/categoryitemdetail_entity.dart';

class CategoryModelItemDetail extends CategoryEntityItemDetail {
  const CategoryModelItemDetail({
    super.id,
    super.categoryName,
    super.publicationStatus,
  });

  factory CategoryModelItemDetail.fromJson(Map<String, dynamic> json) {
    return CategoryModelItemDetail(
      id: json['id'],
      categoryName: json['category_name'],
      publicationStatus: json['publication_status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category_name': categoryName,
      'publication_status': publicationStatus,
    };
  }
}
