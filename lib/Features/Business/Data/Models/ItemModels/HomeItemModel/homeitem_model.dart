import 'package:flutter_application_ebay_ecom/Features/Business/Data/Models/ItemModels/myitem_model.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/ItemsEntites/HomeItems/homeitems_entity.dart';


class HomeitemsModel extends HomeitemsEntity {
  const HomeitemsModel({
    List<MyItemModel>? super.recommendedItems,
    List<MyItemModel>? super.randomItems,
    List<MyItemModel>? super.recentViewed,
    List<MyItemModel>? super.baseOnSearch,
     super.success,
   super.message,

  });

  factory HomeitemsModel.fromJson(Map<String, dynamic> json) {
    return HomeitemsModel(
        success: json['success'],
          message: json['message'],

      recommendedItems: (json['recommendedItems'] as List<dynamic>?)
          ?.map((item) => MyItemModel.fromJson(item as Map<String, dynamic>))
          .toList(),
      randomItems: (json['randomItems'] as List<dynamic>?)
          ?.map((item) => MyItemModel.fromJson(item as Map<String, dynamic>))
          .toList(),
      recentViewed: (json['recentViewed'] as List<dynamic>?)
          ?.map((item) => MyItemModel.fromJson(item as Map<String, dynamic>))
          .toList(),
      baseOnSearch: (json['baseOnSearch'] as List<dynamic>?)
          ?.map((item) => MyItemModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success':success,
      'message':message,
      'recommendedItems': recommendedItems?.map((item) => (item as MyItemModel).toJson()).toList(),
      'randomItems': randomItems?.map((item) => (item as MyItemModel).toJson()).toList(),
      'recentViewed': recentViewed?.map((item) => (item as MyItemModel).toJson()).toList(),
      'baseOnSearch': baseOnSearch?.map((item) => (item as MyItemModel).toJson()).toList(),
    };
  }
}
