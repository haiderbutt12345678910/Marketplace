import 'package:flutter_application_ebay_ecom/AppCores/BlocStates/blocstates.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/SavedItems/saveitem_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/UseCases/recentvieweditem_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetRecentlyViewditemsBloc extends Cubit<BlocStates> {
  final GetRecentlyViewedItemsUseCase getRecentlyViewedItemsUseCase;

  List<SavedItemEntity> savedItemsList = [];
  GetRecentlyViewditemsBloc({required this.getRecentlyViewedItemsUseCase})
      : super(Initial());

  Future<void> getRecentItems() async {
    emit(Loading());

    final result = await getRecentlyViewedItemsUseCase.call();

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
