import 'package:flutter_application_ebay_ecom/AppCores/BlocStates/blocstates.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/UseCases/savedeletercentitems_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedeleterecentitemBloc extends Cubit<BlocStates> {
  final SavedeletercentitemsUsecase savedeletercentitemsUsecase;

  

  SavedeleterecentitemBloc({required this.savedeletercentitemsUsecase }) : super(Initial());

  Future<void> savedeleteRecentItem(String id) async {
    emit(Loading());

    final result = await savedeletercentitemsUsecase.call(id);

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
