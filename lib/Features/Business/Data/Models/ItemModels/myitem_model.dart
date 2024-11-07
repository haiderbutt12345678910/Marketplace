import 'package:flutter_application_ebay_ecom/Features/Business/Data/Models/ItemModels/itemimage_model.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Data/Models/ItemDetailsModel/subentities/categoryitemdetail_model.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/ItemsEntites/myitem_entity.dart';

class MyItemModel extends MyItemEntity {
  const MyItemModel({
    super.id,
    super.categoryId,
    super.itemTitle,
    super.buyItNowPrice,
    super.saleType,
    super.condition,
    super.category,
    super.itemImage,
  });

  factory MyItemModel.fromJson(Map<String, dynamic> json) {
    return MyItemModel(
      id: json['id'],
      categoryId: json['category_id'],
      itemTitle: json['item_title'],
      buyItNowPrice: json['buy_it_now_price'],
      saleType: json['sale_type'],
      condition: json['condition'],
      category: json['category'] != null
          ? CategoryModelItemDetail.fromJson(json['category'])
          : null,
   itemImage: (json['item_image'] as List<dynamic>?)
          ?.map((image) => ItemImageModel.fromJson(image))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category_id': categoryId,
      'item_title': itemTitle,
      'buy_it_now_price': buyItNowPrice,
      'sale_type': saleType,
      'condition': condition,
      'item_image': itemImage
          ?.map((image) => (image as ItemImageModel).toJson())
          .toList(),
      'category':
          (category as CategoryModelItemDetail).toJson(),
    };
  }
}