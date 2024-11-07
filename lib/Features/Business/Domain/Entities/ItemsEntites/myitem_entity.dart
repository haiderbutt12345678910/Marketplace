import 'package:equatable/equatable.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/ItemDetailsEntity/subentities/categoryitemdetail_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/ItemsEntites/subentities/Itemimage_entity.dart';

class MyItemEntity extends Equatable {
  final String? id;
  final String? categoryId;
  final String? itemTitle;
  final String? buyItNowPrice;
  final String? saleType;
  final String? condition;
  final CategoryEntityItemDetail? category;
  final List<ItemImageEntity>? itemImage;

  const MyItemEntity({
    this.id,
    this.categoryId,
    this.itemTitle,
    this.buyItNowPrice,
    this.saleType,
    this.condition,
    this.category,
    this.itemImage,
  });

  @override
  List<Object?> get props => [
        id,
        categoryId,
        itemTitle,
        buyItNowPrice,
        saleType,
        condition,
        category,
        itemImage,
      ];
}