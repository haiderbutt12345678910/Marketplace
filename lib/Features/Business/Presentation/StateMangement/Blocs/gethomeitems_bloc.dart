import 'package:flutter_application_ebay_ecom/AppCores/BlocStates/blocstates.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/ItemsEntites/HomeItems/homeitems_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/UseCases/homeitems_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetHomeItemsBloc extends Cubit<BlocStates> {
  final GetHomeItemUseCase getHomeItemUseCase;

  var homeitemsEntity =  const HomeitemsEntity(success:193, message: "sajksamksm", recommendedItems: [], randomItems: [], recentViewed: [], baseOnSearch: []);
  GetHomeItemsBloc({required this.getHomeItemUseCase}) : super(Initial());

  Future<void> getHomeItems() async {
    emit(Loading());

    final result = await getHomeItemUseCase.call();

    result.fold(
      (failure) {
        
        emit(Failure());
      },
      (model) {
        homeitemsEntity = model;
        emit(Sucessfull());
      },
    );
  }

  HomeitemsEntity getHomeItemEntityLocal() {
    return homeitemsEntity;
  }
}
