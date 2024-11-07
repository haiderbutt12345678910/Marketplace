import 'package:dartz/dartz.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Errors/exceptions.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/repository.dart';

class SaveItemUseCase {
  final Repository repository;
  SaveItemUseCase({required this.repository});

  Future<Either<Failure, void>> call(String itemId) async => repository.saveItem(itemId);
}
