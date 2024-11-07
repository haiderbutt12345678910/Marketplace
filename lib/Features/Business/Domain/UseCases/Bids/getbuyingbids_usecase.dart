import 'package:dartz/dartz.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Errors/exceptions.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/Bids/buyerbid_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/repository.dart';

class GetbuyingbidsUsecase {
  final Repository repository;
  GetbuyingbidsUsecase({required this.repository});

  Future<Either<Failure, List<BidEntity>>> call() async =>
      repository.getBuyingBids();
}
