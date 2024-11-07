import 'package:equatable/equatable.dart';

class RecentlyvieditemsEntity extends Equatable {
  final String id;
  final String createdBy;
  final String itemId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;

  const RecentlyvieditemsEntity({
    required this.id,
    required this.createdBy,
    required this.itemId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  @override
  List<Object?> get props => [
        id,
      ];
}
