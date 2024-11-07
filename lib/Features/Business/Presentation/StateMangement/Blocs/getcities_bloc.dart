import 'package:flutter_application_ebay_ecom/AppCores/BlocStates/blocstates.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/citites_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/UseCases/cities_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetcitiesBloc extends Cubit<BlocStates> {
  final GetCitiesUseCase getCitiesUseCase;

  List<CitiesEntity> citiesList = [];
  GetcitiesBloc({required this.getCitiesUseCase}) : super(Initial());

  Future<void> getCities() async {
    emit(Loading());

    final result = await getCitiesUseCase.call();

    result.fold(
      (failure) {
        emit(Failure());
      },
      (cities) {
        citiesList = cities;
        emit(Sucessfull());
      },
    );
  }

  List<CitiesEntity> getCitiesLocal() {
    return citiesList;
  }
}
