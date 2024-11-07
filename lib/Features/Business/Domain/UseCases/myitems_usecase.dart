import 'package:dartz/dartz.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Errors/exceptions.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/ItemsEntites/myitem_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/repository.dart';

class MyItemsUseCase {
  final Repository repository;
  MyItemsUseCase({required this.repository});

  Future<Either<Failure, List<MyItemEntity>>> call() async =>
      repository.getMyItems();
}
