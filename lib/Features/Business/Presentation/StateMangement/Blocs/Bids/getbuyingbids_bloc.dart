import 'package:flutter_application_ebay_ecom/AppCores/BlocStates/blocstates.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/Bids/buyerbid_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/UseCases/Bids/getbuyingbids_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetbuyingbidsBloc extends Cubit<BlocStates> {
  final GetbuyingbidsUsecase getbuyingbidsUsecase;

  List<BidEntity> bidsList = [];
  GetbuyingbidsBloc({required this.getbuyingbidsUsecase}) : super(Initial());

  Future<void> getBuyingBids() async {
    emit(Loading());

    final result = await getbuyingbidsUsecase.call();

    result.fold(
      (failure) {
        emit(Failure());
      },
      (cities) {
        bidsList = cities;
        emit(Sucessfull());
      },
    );
  }

  List<BidEntity> getbidsListLocal() {
    return bidsList;
  }
}
