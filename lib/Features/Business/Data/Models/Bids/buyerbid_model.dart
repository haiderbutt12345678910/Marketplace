
import 'package:flutter_application_ebay_ecom/Features/Business/Data/Models/ItemModels/item_model.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/Bids/buyerbid_entity.dart';

class BidModel extends BidEntity {
  const BidModel({
    required super.id,
    required super.createdBy,
    required super.itemId,
    super.item,
    super.itemDetail,
    required super.originalPrice,
    required super.bidPrice,
    required super.bidStatus,
    required super.createdAt,
    required super.updatedAt,
    super.deletedAt,
  });

  factory BidModel.fromJson(Map<String, dynamic> json) {
    return BidModel(
      id: json['id'],
      createdBy: json['created_by'],
      itemId: json['item_id'],
      item: json['item'] != null ? ItemModel.fromJson(json['item']) : null,
      itemDetail: json['item_detail'], // Keeping this as is (String)
      originalPrice: double.parse(json['orignal_price'].toString()),
      bidPrice: double.parse(json['bid_price'].toString()),
      bidStatus: json['bid_status'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'] != null ? DateTime.parse(json['deleted_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_by': createdBy,
      'item_id': itemId,
      'item': item != null ? (item as ItemModel).toJson() : null,
      'item_detail': itemDetail,
      'orignal_price': originalPrice,
      'bid_price': bidPrice,
      'bid_status': bidStatus,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'deleted_at': deletedAt?.toIso8601String(),
    };
  }
}
