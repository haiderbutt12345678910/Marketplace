import 'package:dartz/dartz.dart';

import '../Errors/exceptions.dart';

abstract class UsecaseWithParams<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class UsecaseWithoutParams<Type> {
  Future<Either<Failure, Type>> call();
}
