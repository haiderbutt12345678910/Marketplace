import 'package:dartz/dartz.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Errors/exceptions.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Domain/repository.dart';

class GetTokkenUseCase {
  final AuthRepository repository;
  GetTokkenUseCase({required this.repository});

Either<Failure, String> call()  =>
       repository.getTokken();
}
