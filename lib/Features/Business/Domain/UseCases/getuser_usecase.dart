import 'package:dartz/dartz.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Errors/exceptions.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/user_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/repository.dart';

class GetUserUsecase {
  final Repository repository;
  GetUserUsecase({required this.repository});

  Future<Either<Failure, UserEntity>> call() async => repository.getUser();
}
