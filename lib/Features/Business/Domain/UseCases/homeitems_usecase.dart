import 'package:dartz/dartz.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Errors/exceptions.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/ItemsEntites/HomeItems/homeitems_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/repository.dart';

class GetHomeItemUseCase {
  final Repository repository;
  GetHomeItemUseCase({required this.repository});

  Future<Either<Failure, HomeitemsEntity>> call() async =>
      repository.geHomeItems();

  
}
