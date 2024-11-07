import 'package:equatable/equatable.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/ItemDetailsEntity/subentities/categoryitemdetail_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/ItemDetailsEntity/subentities/itemadditinalinfo_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/ItemDetailsEntity/subentities/itemimageentityitemdetail_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/ItemDetailsEntity/subentities/subcategoryitemdetail_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/ItemDetailsEntity/subentities/userentityitemdetail_entity.dart';

class ItemDetailEntity extends Equatable {
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
  final List<ItemImageEntityItemDetail>? itemImages;
  final List<ItemAdditionalInformationEntityItemDetail>?
      itemAdditionalInformation;
  final CategoryEntityItemDetail? category;
  final SubCategoryEntityItemDetail? subCategory;
  final UserEntityItemDetail? user;

  const ItemDetailEntity({
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
    this.itemAdditionalInformation,
    this.category,
    this.subCategory,
    this.user,
  });

  @override
  List<Object?> get props => [
        id,
      ];
}
