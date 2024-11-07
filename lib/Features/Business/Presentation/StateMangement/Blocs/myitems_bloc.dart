import 'package:flutter_application_ebay_ecom/AppCores/BlocStates/blocstates.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/ItemsEntites/myitem_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/UseCases/myitems_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetMyItemsBloc extends Cubit<BlocStates> {
  final MyItemsUseCase myItemsUseCase;

  List<MyItemEntity> myItemsList = [];
  GetMyItemsBloc({required this.myItemsUseCase})
      : super(Initial());

  Future<void> getMyItems() async {
    emit(Loading());

    final result = await myItemsUseCase.call();

    result.fold(
      (failure) {
        emit(Failure());
      },
      (saveditems) {
        myItemsList = saveditems;
        emit(Sucessfull());
      },
    );
  }

  List<MyItemEntity> getSavedItemsLocal() {
    return myItemsList;
  }


   void deleteItem(String itemId) {
    myItemsList.removeWhere((item) => item.id == itemId);  

        emit(Initial());
        emit(Sucessfull());

}
 
}
