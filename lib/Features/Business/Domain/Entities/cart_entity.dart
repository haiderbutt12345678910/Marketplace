import 'package:equatable/equatable.dart';

class CartEntity extends Equatable {
  final String id;
  final String createdBy;
  final String itemId;
  final String quantity;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;

  const CartEntity({
    required this.id,
    required this.createdBy,
    required this.itemId,
    required this.quantity,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  @override
  List<Object?> get props => [
        id,
      ];
}
