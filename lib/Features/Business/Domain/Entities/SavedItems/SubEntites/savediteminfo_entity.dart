import 'package:equatable/equatable.dart';

class SavedItemInfoEntity extends Equatable {
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

  const SavedItemInfoEntity({
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
  });

  @override
  List<Object?> get props => [
        id,
      ];
}
