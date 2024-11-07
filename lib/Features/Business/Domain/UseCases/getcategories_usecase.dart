import 'package:dartz/dartz.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Errors/exceptions.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/category_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/repository.dart';

class GetCategoriesUsecase {
  final Repository repository;
  GetCategoriesUsecase({required this.repository});

  Future<Either<Failure, List<CategoryEntity>>> call() async =>
      repository.getCategories();
}
