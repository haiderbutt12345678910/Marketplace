import 'package:dartz/dartz.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Errors/exceptions.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Domain/repository.dart';

class UpdatepasswordUsecase {
  final AuthRepository repository;
  UpdatepasswordUsecase({required this.repository});

Future<Either<Failure, void>> call(String currentpassword,String newpassword)  =>
       repository.updatePassword(currentpassword,newpassword);
}
