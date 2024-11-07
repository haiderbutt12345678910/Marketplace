import 'package:flutter_application_ebay_ecom/AppCores/BlocStates/blocstates.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/Sliders/slider_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/UseCases/sliders_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetSliderBloc extends Cubit<BlocStates> {
  final SlidersUsecase slidersUsecase;

  GetSliderBloc({required this.slidersUsecase, }) : super(Initial());
  List<SliderEntity> sliderEntityList=[];

  Future<void> getSlider() async {
    emit(Loading());

    final result = await slidersUsecase.call();

    result.fold(
      (failure) {
        emit(Failure());
      },
      (list) {
       sliderEntityList=list;
        emit(Sucessfull());
      },
    );
  }

  List<SliderEntity> getSliderLocal(){
    return sliderEntityList;
  }
}
