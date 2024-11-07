import 'package:dartz/dartz.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Errors/exceptions.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/membership_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/repository.dart';

class GetAllMembershipsUseCase {
  final Repository repository;
  GetAllMembershipsUseCase({required this.repository});

  Future<Either<Failure, List<MembershipEntity>>> call() async =>
      repository.getAllMemberships();
}
