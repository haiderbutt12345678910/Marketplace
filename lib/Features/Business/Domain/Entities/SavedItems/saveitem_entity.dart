import 'package:equatable/equatable.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/SavedItems/SubEntites/savediteminfo_entity.dart';

class SavedItemEntity extends Equatable {
  final String id;
  final String createdBy;
  final String itemId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final SavedItemInfoEntity item;

  const SavedItemEntity({
    required this.id,
    required this.createdBy,
    required this.itemId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.item,
  });

  @override
  List<Object?> get props => [
        id,
      ];
}
