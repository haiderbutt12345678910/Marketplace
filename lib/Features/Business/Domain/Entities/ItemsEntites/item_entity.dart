import 'package:equatable/equatable.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/ItemDetailsEntity/subentities/categoryitemdetail_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/ItemDetailsEntity/subentities/subcategoryitemdetail_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/ItemsEntites/subentities/Itemimage_entity.dart';

class ItemEntity extends Equatable {
  final String? id;
  final String? createdBy;
  final String? categoryId;
  final String? subCategoryId;
  final String? itemTitle;
  final String? condition;
  final String? conditionDescription;
  final String? saleType;
  final String? auctionDuration;
  final int? quantity;
  final double? startBiddingPrice;
  final double? buyItNowPrice;
  final double? shippingPrice;
  final String? shippingDuration;
  final String? shortDescription;
  final String? videoUrl;
  final String? promotion;
  final double? promotionPrice;
  final String? promotionExpiry;
  final String? publicationStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final List<ItemImageEntity>? itemImages;
  final CategoryEntityItemDetail? categoryEntityItemDetail;
  final SubCategoryEntityItemDetail? subCategoryEntityItemDetail;
  const ItemEntity({
    this.categoryEntityItemDetail,
    this.subCategoryEntityItemDetail,
    this.id,
    this.createdBy,
    this.categoryId,
    this.subCategoryId,
    this.itemTitle,
    this.condition,
    this.conditionDescription,
    this.saleType,
    this.auctionDuration,
    this.quantity,
    this.startBiddingPrice,
    this.buyItNowPrice,
    this.shippingPrice,
    this.shippingDuration,
    this.shortDescription,
    this.videoUrl,
    this.promotion,
    this.promotionPrice,
    this.promotionExpiry,
    this.publicationStatus,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.itemImages,
  });

  @override
  List<Object?> get props => [
        id,
      ];
}
