import 'package:equatable/equatable.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/ItemsEntites/item_entity.dart';

class BidEntity extends Equatable {
  final String id;
  final String createdBy;
  final String itemId;
  final ItemEntity? item;
  final String? itemDetail; // Since this is a JSON string, we keep it as String.
  final double originalPrice;
  final double bidPrice;
  final String bidStatus;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;

  const BidEntity({
    required this.id,
    required this.createdBy,
    required this.itemId,
    this.item,
    this.itemDetail,
    required this.originalPrice,
    required this.bidPrice,
    required this.bidStatus,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  @override
  List<Object?> get props => [
        id,
     
      ];
}
