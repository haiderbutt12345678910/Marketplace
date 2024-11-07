import 'package:dartz/dartz.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Errors/exceptions.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/ItemsEntites/item_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/repository.dart';

class GetitemsUsecase {
  final Repository repository;
  GetitemsUsecase({required this.repository});

  Future<Either<Failure, List<ItemEntity>>> call(int count) async =>
      repository.getItems(count);
}
