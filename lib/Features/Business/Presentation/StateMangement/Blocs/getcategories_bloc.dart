import 'package:flutter_application_ebay_ecom/AppCores/BlocStates/blocstates.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/category_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/UseCases/getcategories_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetCategoriesBloc extends Cubit<BlocStates> {
  final GetCategoriesUsecase getCategoriesUsecase;

  List<CategoryEntity> catList = [];

  GetCategoriesBloc({required this.getCategoriesUsecase}) : super(Initial());

  Future<void> getCat() async {
    emit(Loading());

    final result = await getCategoriesUsecase.call();

    result.fold(
      (failure) {
        emit(Failure());
      },
      (items) {
        catList = items;
        emit(Sucessfull());
      },
    );
  }

  List<CategoryEntity> getLocalList() {
    return catList;
  }
}
