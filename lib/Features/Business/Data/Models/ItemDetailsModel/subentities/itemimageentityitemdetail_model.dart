import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/ItemDetailsEntity/subentities/itemimageentityitemdetail_entity.dart';

class ItemImageModelItemDetail extends ItemImageEntityItemDetail {
  const ItemImageModelItemDetail({
    super.id,
    super.itemId,
    super.image,
  });

  factory ItemImageModelItemDetail.fromJson(Map<String, dynamic> json) {
    return ItemImageModelItemDetail(
      id: json['id'],
      itemId: json['item_id'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'item_id': itemId,
      'image': image,
    };
  }
}
