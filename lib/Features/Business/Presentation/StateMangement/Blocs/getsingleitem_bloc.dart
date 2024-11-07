import 'package:flutter_application_ebay_ecom/AppCores/BlocStates/blocstates.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/ItemDetailsEntity/itemdetail_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/UseCases/getsingleitem_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetsingleitemBloc extends Cubit<BlocStates> {
  final GetSingleItemUseCase getSingleItemUseCase;

  ItemDetailEntity itemDetailEntity = ItemDetailEntity(
      id: "",
      publicationStatus: "",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now());

  GetsingleitemBloc({required this.getSingleItemUseCase}) : super(Initial());

  Future<void> getUser(String id) async {
    emit(Loading());

    final result = await getSingleItemUseCase.call(id);

    result.fold(
      (failure) {
        emit(Failure());
      },
      (itemDetails) {
        itemDetailEntity = itemDetails;
        emit(Sucessfull());
      },
    );
  }

  ItemDetailEntity getItemDetailsLocal() {
    return itemDetailEntity;
  }
}
