import 'package:dartz/dartz.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Errors/exceptions.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Domain/repository.dart';

class AuthLoginUseCase {
  final AuthRepository repository;
  AuthLoginUseCase({required this.repository});

  Future<Either<Failure, void>> call(String email, String password) async =>
      await repository.logIn(email, password);
}
