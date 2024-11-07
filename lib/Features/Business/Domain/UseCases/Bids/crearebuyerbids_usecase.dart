import 'package:dartz/dartz.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Errors/exceptions.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/repository.dart';

class CreatebuyingbidsUsecase {
  final Repository repository;
  CreatebuyingbidsUsecase({required this.repository});

  Future<Either<Failure, void>> call(String itemId,String originalPrice,String bidPrice) async =>
      repository.createBid(itemId,originalPrice,bidPrice);
}
