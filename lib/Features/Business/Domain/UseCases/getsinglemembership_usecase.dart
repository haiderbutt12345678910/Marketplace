import 'package:dartz/dartz.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Errors/exceptions.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/membership_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/repository.dart';

class GetSingleMemberShipUseCase {
  final Repository repository;
  GetSingleMemberShipUseCase({required this.repository});

  Future<Either<Failure, MembershipEntity>> call(String id) async =>
      repository.getSingleMembership(id);
}
