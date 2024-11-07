import 'package:dartz/dartz.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Errors/exceptions.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Data/DataSources/remotedatasource.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Domain/Entitites/Register/register_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Domain/repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource authDataSource;
  AuthRepositoryImpl({required this.authDataSource});

  @override
  Future<Either<Failure, void>> logIn(String email, String password) async {
    try {
      return Right(await authDataSource.logIn(email, password));
    } catch (e) {
      return const Left(ApiFailure(error: "Error", statusCode: "404"));
    }
  }
  
  @override
  Either<Failure, String> getTokken() {
     try {
      return Right( authDataSource.getTokken());
    } catch (e) {
      return const Left(ApiFailure(error: "Error", statusCode: "404"));
    }
  }

  @override
  Future<Either<Failure, void>> forgotPassword(String email)async {
    try {
      return Right( await authDataSource.forgotPassword(email));
    } catch (e) {
      return  Left(ApiFailure(error: e.toString(), statusCode:"" ));
    }
  }

  @override
  Future<Either<Failure, void>> register(RegisterEntity registerEntity) async {
    try {
      return Right( await authDataSource.register(registerEntity));
    } catch (e) {
      return  Left(ApiFailure(error: e.toString(), statusCode:"" ));
    }
  }
  
  @override
  Future<Either<Failure, void>> updatePassword(String currentpassword, String newpassword)async {
   try {
      return Right( await authDataSource.updatePassword(currentpassword,newpassword));
    } catch (e) {
      return  Left(ApiFailure(error: e.toString(), statusCode:"" ));
    }
  }
  
 

  
 
}
