import 'package:dartz/dartz.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Errors/exceptions.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/cart_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/repository.dart';

class GetCartUseCase {
  final Repository repository;
  GetCartUseCase({required this.repository});

  Future<Either<Failure, List<CartEntity>>> call() async =>
      repository.getCartItems();

  Future<Either<Failure, void>> addToCart(String id) async =>
      repository.addCartItem(id);

  Future<Either<Failure, void>> removeCart(String id) async =>
      repository.removeCartItem(id);


      Future<Either<Failure, void>> updateCartQuantinty(String cartId,String cartQuantity) async =>
      repository.updateCartQuantinty(cartId,cartQuantity);
}
