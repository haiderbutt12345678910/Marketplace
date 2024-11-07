import 'package:flutter_application_ebay_ecom/AppCores/BlocStates/blocstates.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Domain/Entitites/Register/register_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Domain/Usecases/register_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegsiterBloc extends Cubit<BlocStates> {
  final AuthRegisterUseCase authRegisterUseCase;
  String exception = "";

  RegsiterBloc({required this.authRegisterUseCase, }) : super(Initial());

  Future<void> register(RegisterEntity registerEntity) async {
    emit(Loading());

    final result = await authRegisterUseCase.call(registerEntity);

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
