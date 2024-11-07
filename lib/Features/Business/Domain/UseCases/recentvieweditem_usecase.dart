import 'package:dartz/dartz.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Errors/exceptions.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/SavedItems/saveitem_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/repository.dart';

class GetRecentlyViewedItemsUseCase {
  final Repository repository;
  GetRecentlyViewedItemsUseCase({required this.repository});

  Future<Either<Failure, List<SavedItemEntity>>> call() async =>
      repository.getrecentItems();
}
