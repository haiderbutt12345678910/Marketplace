import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/ItemDetailsEntity/subentities/itemadditinalinfo_entity.dart';

class ItemAdditionalInformationModelItemDetail
    extends ItemAdditionalInformationEntityItemDetail {
  const ItemAdditionalInformationModelItemDetail({
    super.id,
    super.itemId,
    super.title,
    super.value,
  });

  factory ItemAdditionalInformationModelItemDetail.fromJson(
      Map<String, dynamic> json) {
    return ItemAdditionalInformationModelItemDetail(
      id: json['id'],
      itemId: json['item_id'],
      title: json['title'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'item_id': itemId,
      'title': title,
      'value': value,
    };
  }
}
