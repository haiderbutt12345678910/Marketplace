import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/ItemsEntites/subentities/Itemimage_entity.dart';

class ItemImageModel extends ItemImageEntity {
  const ItemImageModel({
    super.id,
    super.itemId,
    super.imageUrl,
  });

  factory ItemImageModel.fromJson(Map<String, dynamic> json) {
    return ItemImageModel(
      id: json['id'],
      itemId: json['item_id'],
      imageUrl: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'item_id': itemId,
      'image': imageUrl,
    };
  }
}
