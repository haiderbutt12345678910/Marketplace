import 'package:dartz/dartz.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Errors/exceptions.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/Sliders/slider_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/repository.dart';

class SlidersUsecase {
  final Repository repository;
  SlidersUsecase({required this.repository});

  Future<Either<Failure,List<SliderEntity>>> call() async =>
      repository.getSliders();
}
