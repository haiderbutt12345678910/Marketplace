import 'package:dartz/dartz.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Errors/exceptions.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Domain/repository.dart';

class ForgotpasswordUsecase {
  final AuthRepository repository;
  ForgotpasswordUsecase({required this.repository});

Future<Either<Failure, void>> call(String email)  =>
       repository.forgotPassword(email);
}
