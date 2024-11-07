import 'package:dartz/dartz.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Errors/exceptions.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/ItemDetailsEntity/itemdetail_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/repository.dart';

class GetSingleItemUseCase {
  final Repository repository;
  GetSingleItemUseCase({required this.repository});

  Future<Either<Failure, ItemDetailEntity>> call(String id) async =>
      repository.getSingleItem(id);
}
