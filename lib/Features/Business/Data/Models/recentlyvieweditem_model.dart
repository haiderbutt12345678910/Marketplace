import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/recentlyvieditems_entity.dart';

class RecentlyvieweditemModel extends RecentlyvieditemsEntity {
  const RecentlyvieweditemModel({
    required super.id,
    required super.createdBy,
    required super.itemId,
    required super.createdAt,
    required super.updatedAt,
    super.deletedAt,
  });

  factory RecentlyvieweditemModel.fromJson(Map<String, dynamic> json) {
    return RecentlyvieweditemModel(
      id: json['id'],
      createdBy: json['created_by'],
      itemId: json['item_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'] != null
          ? DateTime.parse(json['deleted_at'])
          : null,
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
    };
  }
}
