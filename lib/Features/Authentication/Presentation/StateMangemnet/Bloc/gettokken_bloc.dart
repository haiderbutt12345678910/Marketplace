import 'package:flutter_application_ebay_ecom/Features/Authentication/Domain/Usecases/gttokken_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../AppCores/BlocStates/blocstates.dart';

class GettokkenBloc extends Cubit<BlocStates> {
  GetTokkenUseCase getTokkenUseCase;

  GettokkenBloc({required this.getTokkenUseCase}) : super(Initial());
 String tokken='';
  void getTokken()  {
    final result =  getTokkenUseCase.call();

    result.fold(
      (failure) {
        emit(Failure());
      },
      (value) {
        tokken=value;
        emit(Sucessfull());
      },
    );
  }

  String getTokkenLocal(){

    return tokken;

  }
}
