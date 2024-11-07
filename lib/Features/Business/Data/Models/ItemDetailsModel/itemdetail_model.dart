import 'package:flutter_application_ebay_ecom/Features/Business/Data/Models/ItemDetailsModel/subentities/categoryitemdetail_model.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Data/Models/ItemDetailsModel/subentities/itemadditinalinfo_model.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Data/Models/ItemDetailsModel/subentities/itemimageentityitemdetail_model.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Data/Models/ItemDetailsModel/subentities/subcategoryitemdetail_model.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Data/Models/ItemDetailsModel/subentities/useritemdetail_model.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/ItemDetailsEntity/itemdetail_entity.dart';

class ItemDetailModel extends ItemDetailEntity {
  const ItemDetailModel({
    super.id,
    super.createdBy,
    super.categoryId,
    super.subCategoryId,
    super.itemTitle,
    super.condition,
    super.conditionDescription,
    super.saleType,
    super.auctionDuration,
    super.quantity,
    super.startBiddingPrice,
    super.buyItNowPrice,
    super.shippingPrice,
    super.shippingDuration,
    super.shortDescription,
    super.videoUrl,
    super.promotion,
    super.promotionPrice,
    super.promotionExpiry,
    super.publicationStatus,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    super.itemImages,
    super.itemAdditionalInformation,
    super.category,
    super.subCategory,
    super.user,
  });

  factory ItemDetailModel.fromJson(Map<String, dynamic> json) {
    return ItemDetailModel(
      id: json['id'],
      createdBy: json['created_by'],
      categoryId: json['category_id'],
      subCategoryId: json['sub_category_id'],
      itemTitle: json['item_title'],
      condition: json['condition'],
      conditionDescription: json['condition_description'],
      saleType: json['sale_type'],
      auctionDuration: json['auction_duration'],
      quantity: json['quantity'] is int
          ? json['quantity']
          : int.tryParse(json['quantity']),
      startBiddingPrice: json['start_bidding_price'] != null &&
              json['start_bidding_price'] != ''
          ? double.tryParse(json['start_bidding_price'])
          : null,
      buyItNowPrice:
          json['buy_it_now_price'] != null && json['buy_it_now_price'] != ''
              ? double.tryParse(json['buy_it_now_price'])
              : null,
      shippingPrice:
          json['shipping_price'] != null && json['shipping_price'] != ''
              ? double.tryParse(json['shipping_price'])
              : null,
      shippingDuration: json['shipping_duration'],
      shortDescription: json['short_description'],
      videoUrl: json['video_url'],
      promotion: json['promotion'],
      promotionPrice:
          json['promotion_price'] != null && json['promotion_price'] != ''
              ? double.tryParse(json['promotion_price'])
              : null,
      promotionExpiry: json['promotion_expiry'],
      publicationStatus: json['publication_status'],
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'])
          : null,
      deletedAt: json['deleted_at'] != null
          ? DateTime.tryParse(json['deleted_at'])
          : null,
      itemImages: (json['item_image'] as List<dynamic>?)
          ?.map((image) => ItemImageModelItemDetail.fromJson(image))
          .toList(),
      itemAdditionalInformation: (json['item_additional_information']
              as List<dynamic>?)
          ?.map(
              (info) => ItemAdditionalInformationModelItemDetail.fromJson(info))
          .toList(),
      category: json['category'] != null
          ? CategoryModelItemDetail.fromJson(json['category'])
          : null,
      subCategory: json['sub_category'] != null
          ? SubCategoryModelItemDetail.fromJson(json['sub_category'])
          : null,
      user: json['user'] != null
          ? UserModelItemDetail.fromJson(json['user'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_by': createdBy,
      'category_id': categoryId,
      'sub_category_id': subCategoryId,
      'item_title': itemTitle,
      'condition': condition,
      'condition_description': conditionDescription,
      'sale_type': saleType,
      'auction_duration': auctionDuration,
      'quantity': quantity,
      'start_bidding_price': startBiddingPrice,
      'buy_it_now_price': buyItNowPrice,
      'shipping_price': shippingPrice,
      'shipping_duration': shippingDuration,
      'short_description': shortDescription,
      'video_url': videoUrl,
      'promotion': promotion,
      'promotion_price': promotionPrice,
      'promotion_expiry': promotionExpiry,
      'publication_status': publicationStatus,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'deleted_at': deletedAt?.toIso8601String(),
      'item_image': itemImages
          ?.map((image) => (image as ItemImageModelItemDetail).toJson())
          .toList(),
      'item_additional_information': itemAdditionalInformation
          ?.map((info) =>
              (info as ItemAdditionalInformationModelItemDetail).toJson())
          .toList(),
      'category': (category as CategoryModelItemDetail).toJson(),
      'sub_category': (subCategory as SubCategoryModelItemDetail).toJson(),
      'user': (user as UserModelItemDetail).toJson(),
    };
  }
}
