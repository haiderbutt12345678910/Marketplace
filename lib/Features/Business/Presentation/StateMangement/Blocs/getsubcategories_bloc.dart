import 'package:flutter_application_ebay_ecom/AppCores/BlocStates/blocstates.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/subcategory_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/UseCases/getsubcategories_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetSubCategoriesBloc extends Cubit<BlocStates> {
  final GetSubCategoriesUsecase getSubCategoriesUsecase;

  List<SubCategoryEntity> subcatList = [];

  GetSubCategoriesBloc({required this.getSubCategoriesUsecase})
      : super(Initial());

  Future<void> getSubCat() async {
    emit(Loading());

    final result = await getSubCategoriesUsecase.call();

    result.fold(
      (failure) {
        emit(Failure());
      },
      (items) {
        subcatList = items;
        emit(Sucessfull());
      },
    );
  }

  List<SubCategoryEntity> getLocalList(String catId) {
    return subcatList
        .where((item) =>
            item.categoryId.toLowerCase().contains(catId.toLowerCase()))
        .toList();
  }

  List<SubCategoryEntity> getLocalListSubCats() {
    return subcatList;
       
  }
}
