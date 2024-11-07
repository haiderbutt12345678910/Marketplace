import 'package:dartz/dartz.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Domain/Usecases/loginusecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../AppCores/BlocStates/blocstates.dart';

class LogInCubit extends Cubit<BlocStates> {
  AuthLoginUseCase logInUseCase;

  LogInCubit({required this.logInUseCase}) : super(Initial());

  Future<void> logIn(String email, String password) async {
    emit(Loading());
    await logInUseCase.call(email, password).then((onValue) {
      if (onValue is Left) {
        emit(Failure());
      } else {
        
        emit(Sucessfull());
      }
    });
  }
}
