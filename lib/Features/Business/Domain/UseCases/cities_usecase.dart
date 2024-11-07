import 'package:dartz/dartz.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Errors/exceptions.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/citites_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/repository.dart';

class GetCitiesUseCase {
  final Repository repository;
  GetCitiesUseCase({required this.repository});

  Future<Either<Failure, List<CitiesEntity>>> call() async =>
      repository.getCitites();
}
