import 'package:equatable/equatable.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/ItemsEntites/myitem_entity.dart';

class HomeitemsEntity extends Equatable {
  final List<MyItemEntity>? recommendedItems;
  final List<MyItemEntity>? randomItems;
  final List<MyItemEntity>? recentViewed;
  final List<MyItemEntity>? baseOnSearch;
  final int? success;
   final String? message;

   const HomeitemsEntity({
    required this.success,
    required this.message,

   required this.recommendedItems,
   required this.randomItems,
   required this.recentViewed,
    required this.baseOnSearch,
  });

  @override
  List<Object?> get props => [
   
  ];
}
