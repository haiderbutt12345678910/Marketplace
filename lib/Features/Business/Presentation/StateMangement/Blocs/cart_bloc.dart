import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/BlocStates/blocstates.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/snackbarcutom.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/cart_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/UseCases/cart_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetCartBloc extends Cubit<BlocStates> {
  final GetCartUseCase getCartUseCase;
  String addedState = "S";

  bool alreadyCalled=false;
  List<CartEntity> cartList = [];

  GetCartBloc({required this.getCartUseCase}) : super(Initial());

  Future<void> getCat() async {
    emit(Loading());

    final result = await getCartUseCase.call();

    result.fold(
      (failure) {
        emit(Failure());
      },
      (items) {
        alreadyCalled=true;
        cartList = items;
        emit(Sucessfull());
      },
    );
  }

  List<CartEntity> getLocalList() {
    return cartList;
  }

  Future<void> addToCart(String id,BuildContext context) async {
    emit(Loading());

    final result = await getCartUseCase.addToCart(id);

    result.fold(
      (failure) {
        emit(Failure());
        addedState = "F";
      },
      (_) {
        emit(Sucessfull());
        addedState = "S";
        getCat().then((_){
        
        //  CustomSnackbar.show(
        //         iconData: Icons.check_circle_outline,
                
        //       // ignore: use_build_context_synchronously
        //       buildContext: context, errorheading: " Success!", error: "Quatity updated successfully", iconColor: Colors.green);
                

        });
      },
    );
  }

  Future<void> removeCart(String id,BuildContext context) async {
    emit(Loading());

    final result = await getCartUseCase.removeCart(id);

    result.fold(
      (failure) {
        emit(Failure());
      },
      (_) {


        emit(Sucessfull());

        getCat().then((_){
        
         CustomSnackbar.show(
                iconData: Icons.check_circle_outline,
                
              // ignore: use_build_context_synchronously
              buildContext: context, errorheading: " Success!", error: "Item deleted successfully", iconColor: Colors.green);
                

        });
      },
    );
  }


    Future<void> updateCartQuantinty(String cartId,String cartQuantity, BuildContext context) async {
    emit(Loading());

    final result = await getCartUseCase.updateCartQuantinty(cartId,cartQuantity);

    result.fold(
      (failure) {
        print(failure.toString());
        emit(Failure());
      },
      (_) {
        print("Suceess");

        emit(Sucessfull());

        getCat().then((_){
        
         CustomSnackbar.show(
                iconData: Icons.check_circle_outline,
                
              // ignore: use_build_context_synchronously
              buildContext: context, errorheading: " Success!", error: "Cart updated Successfully", iconColor: Colors.green);
                

        });
      },
    );
  }
}
