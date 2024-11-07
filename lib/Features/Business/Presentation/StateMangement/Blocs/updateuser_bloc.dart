import 'package:flutter_application_ebay_ecom/AppCores/BlocStates/blocstates.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/user_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/UseCases/updateuser_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateuserBloc extends Cubit<BlocStates> {
  final UpdateUserUsecase updateUserUsecase;

  UpdateuserBloc({required this.updateUserUsecase}) : super(Initial());

  Future<void> updateUser(UserUpdateEntity userEntity) async {
    emit(Loading());

    final result = await updateUserUsecase.call(userEntity);

    result.fold(
      (failure) {
        emit(Failure());
      },
      (_) {
        emit(Sucessfull());
      },
    );
  }
}
