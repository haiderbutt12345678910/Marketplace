import 'package:flutter_application_ebay_ecom/Features/Business/Data/Models/SavedItemsModel/SubEntities/savediteminfo_model.dart';

import '../../../Domain/Entities/SavedItems/saveitem_entity.dart';

class SavedItemModel extends SavedItemEntity {
  const SavedItemModel({
    required super.id,
    required super.createdBy,
    required super.itemId,
    required super.createdAt,
    required super.updatedAt,
    super.deletedAt,
    required super.item,
  });

  factory SavedItemModel.fromJson(Map<String, dynamic> json) {
    return SavedItemModel(
      id: json['id'],
      createdBy: json['created_by'],
      itemId: json['item_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'] != null
          ? DateTime.parse(json['deleted_at'])
          : null,
      item: SavedItemInfoModel.fromJson(json['item']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_by': createdBy,
      'item_id': itemId,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'deleted_at': deletedAt?.toIso8601String(),
      'item': (item as SavedItemInfoModel).toJson(),
    };
  }
}
