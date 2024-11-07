import 'package:dartz/dartz.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Errors/exceptions.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/repository.dart';

class SavedeletercentitemsUsecase {
  final Repository repository;
  SavedeletercentitemsUsecase({required this.repository});

  Future<Either<Failure, void>> call(String itemId) async => repository.savedeleteRecentItem(itemId);
}
