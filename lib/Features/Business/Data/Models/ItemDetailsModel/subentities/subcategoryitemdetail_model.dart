import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/ItemDetailsEntity/subentities/subcategoryitemdetail_entity.dart';

class SubCategoryModelItemDetail extends SubCategoryEntityItemDetail {
  const SubCategoryModelItemDetail({
    super.id,
    super.subCategoryName,
    super.publicationStatus,
  });

  factory SubCategoryModelItemDetail.fromJson(Map<String, dynamic> json) {
    return SubCategoryModelItemDetail(
      id: json['id'],
      subCategoryName: json['sub_category_name'],
      publicationStatus: json['publication_status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sub_category_name': subCategoryName,
      'publication_status': publicationStatus,
    };
  }
}
