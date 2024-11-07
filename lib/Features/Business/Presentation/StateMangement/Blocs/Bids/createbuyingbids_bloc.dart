import 'package:flutter_application_ebay_ecom/AppCores/BlocStates/blocstates.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/UseCases/Bids/crearebuyerbids_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatebuyingbidsBloc extends Cubit<BlocStates> {
  final CreatebuyingbidsUsecase createbuyingbidsUsecase;

  CreatebuyingbidsBloc({required this.createbuyingbidsUsecase}) : super(Initial());
     String exception='';

  Future<void> createBuyingBid(String itemId,String originalPrice,String bidPrice) async {
    emit(Loading());

    final result = await createbuyingbidsUsecase.call(itemId,originalPrice,bidPrice);

    result.fold(
      (failure) {
        exception=failure.error;
        emit(Failure());

      },
      (_) {
        emit(Sucessfull());
      },
    );
  }

  String getException() {
    return exception;
  }
}
