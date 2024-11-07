import 'package:flutter_application_ebay_ecom/AppCores/BlocStates/blocstates.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/UseCases/savedeletesaveitem_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaveItemBloc extends Cubit<BlocStates> {
  final SaveItemUseCase saveItemUseCase;

  

  SaveItemBloc({required this.saveItemUseCase }) : super(Initial());

  Future<void> saveItem(String id) async {
    emit(Loading());

    final result = await saveItemUseCase.call(id);

    result.fold(
      (failure) {
        emit(Failure());
      },
      (user) {
        emit(Sucessfull());
      },
    );
  }

  
}
