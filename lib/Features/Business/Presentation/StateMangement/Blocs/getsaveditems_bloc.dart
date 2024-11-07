import 'package:flutter_application_ebay_ecom/AppCores/BlocStates/blocstates.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/SavedItems/saveitem_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/UseCases/getsaveditems_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetsaveditemsBloc extends Cubit<BlocStates> {
  final GetSavedItemsUseCase getSavedItemsUseCase;

  List<SavedItemEntity> savedItemsList = [];
  GetsaveditemsBloc({required this.getSavedItemsUseCase}) : super(Initial());

  Future<void> getSavedItems() async {
    emit(Loading());

    final result = await getSavedItemsUseCase.call();

    result.fold(
      (failure) {
        emit(Failure());
      },
      (saveditems) {
       
        savedItemsList = saveditems;


        emit(Sucessfull());
      },
    );
  }

  List<SavedItemEntity> getSavedItemsLocal() {
    return savedItemsList;
  }
}
