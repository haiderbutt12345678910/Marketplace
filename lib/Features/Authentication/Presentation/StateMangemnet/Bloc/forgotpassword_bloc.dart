import 'package:flutter_application_ebay_ecom/AppCores/BlocStates/blocstates.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Domain/Usecases/forgotpassword_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotpasswordBloc extends Cubit<BlocStates> {
  final ForgotpasswordUsecase forgotpasswordUsecase;
  String exception="";

  ForgotpasswordBloc({required this.forgotpasswordUsecase, }) : super(Initial());

  Future<void> forgotpassword(String email) async {
    emit(Loading());

    final result = await forgotpasswordUsecase.call(email);

    result.fold(
      (failure) {
        exception=failure.error;
        emit(Failure());
      },
      (_) {
        emit(Sucessfull());
      },
    );
  }

 

}
