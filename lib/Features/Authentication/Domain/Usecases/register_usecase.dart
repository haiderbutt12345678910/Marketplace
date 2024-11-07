import 'package:dartz/dartz.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Errors/exceptions.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Domain/Entitites/Register/register_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Domain/repository.dart';

class AuthRegisterUseCase {
  final AuthRepository repository;
  AuthRegisterUseCase({required this.repository});

  Future<Either<Failure, void>> call(RegisterEntity registerEntity) async =>
      await repository.register(registerEntity);
}
