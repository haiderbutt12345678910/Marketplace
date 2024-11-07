import 'package:dartz/dartz.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Domain/Entitites/Register/register_entity.dart';

import '../../../AppCores/Errors/exceptions.dart';

abstract class AuthRepository {
  const AuthRepository();
  Future<Either<Failure, void>> logIn(String email, String password);
  Either<Failure,String>  getTokken();
  Future<Either<Failure, void>> register(RegisterEntity registerEntity);
  Future<Either<Failure, void>> forgotPassword(String email);
  Future<Either<Failure, void>>  updatePassword(String currentpassword,String newpassword);






}
