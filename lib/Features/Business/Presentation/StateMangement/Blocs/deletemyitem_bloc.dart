import 'package:flutter_application_ebay_ecom/AppCores/BlocStates/blocstates.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/UseCases/deletemyitem_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteMyItemBloc extends Cubit<BlocStates> {
  final DeleteMyItemUseCase deleteMyItemUseCase;

  
  String itemId="";
  DeleteMyItemBloc({required this.deleteMyItemUseCase }) : super(Initial());

  Future<void> deleteMyItem(String id) async {
    emit(Loading());

    final result = await deleteMyItemUseCase.call(id);

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
