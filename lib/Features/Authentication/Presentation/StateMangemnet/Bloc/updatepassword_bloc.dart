import 'package:flutter_application_ebay_ecom/AppCores/BlocStates/blocstates.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Domain/Usecases/updatepassword_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdatepasswordBloc extends Cubit<BlocStates> {
  final UpdatepasswordUsecase updatepasswordUsecase;
  String exception = "";

  UpdatepasswordBloc({required this.updatepasswordUsecase, }) : super(Initial());

  Future<void> updatePassowrd(String currentPassword,String newpassword) async {
    emit(Loading());

    final result = await updatepasswordUsecase.call(currentPassword,newpassword);

    result.fold(
      (failure) {
         exception=failure.error.toString();
        emit(Failure());
      },
      (_) {
        emit(Sucessfull());
      },
    );
  }

 
  String getException(){
    return exception;
  }
}
