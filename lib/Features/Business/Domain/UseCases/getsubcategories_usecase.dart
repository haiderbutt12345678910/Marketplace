import 'package:dartz/dartz.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Errors/exceptions.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/subcategory_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/repository.dart';

class GetSubCategoriesUsecase {
  final Repository repository;
  GetSubCategoriesUsecase({required this.repository});

  Future<Either<Failure, List<SubCategoryEntity>>> call() async =>
      repository.getSubCategories();
}
