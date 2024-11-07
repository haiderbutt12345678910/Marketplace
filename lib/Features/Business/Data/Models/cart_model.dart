import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/cart_entity.dart';

class CartModel extends CartEntity {
  const CartModel({
    required super.id,
    required super.createdBy,
    required super.itemId,
    required super.quantity,
    required super.createdAt,
    required super.updatedAt,
    required super.deletedAt,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      createdBy: json['created_by'],
      itemId: json['item_id'],
      quantity: json['quantity'],
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
      'quantity': quantity,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'deleted_at': deletedAt?.toIso8601String(),
    };
  }
}
