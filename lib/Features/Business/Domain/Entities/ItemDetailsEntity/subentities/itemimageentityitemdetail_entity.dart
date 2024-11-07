import 'package:equatable/equatable.dart';

class ItemImageEntityItemDetail extends Equatable {
  final String? id;
  final String? itemId;
  final String? image;

  const ItemImageEntityItemDetail({
    this.id,
    this.itemId,
    this.image,
  });

  @override
  List<Object?> get props => [
        id,
      ];
}
