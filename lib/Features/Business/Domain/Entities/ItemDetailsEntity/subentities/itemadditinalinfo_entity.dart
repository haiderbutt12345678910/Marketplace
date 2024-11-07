import 'package:equatable/equatable.dart';

class ItemAdditionalInformationEntityItemDetail extends Equatable {
  final String? id;
  final String? itemId;
  final String? title;
  final String? value;

  const ItemAdditionalInformationEntityItemDetail({
    this.id,
    this.itemId,
    this.title,
    this.value,
  });

  @override
  List<Object?> get props => [
        id,
      ];
}
