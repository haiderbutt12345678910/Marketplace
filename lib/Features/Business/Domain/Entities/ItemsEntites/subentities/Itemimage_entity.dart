// ignore: file_names
import 'package:equatable/equatable.dart';

class ItemImageEntity extends Equatable {
  final String? id;
  final String? itemId;
  final String? imageUrl;

  const ItemImageEntity({
    this.id,
    this.itemId,
    this.imageUrl,
  });

  @override
  List<Object?> get props => [id];
}
