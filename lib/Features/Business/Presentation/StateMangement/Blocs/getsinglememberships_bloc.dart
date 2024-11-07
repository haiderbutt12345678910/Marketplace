import 'package:flutter_application_ebay_ecom/AppCores/BlocStates/blocstates.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/membership_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/UseCases/getsinglemembership_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetsinglemembershipsBloc extends Cubit<BlocStates> {
  final GetSingleMemberShipUseCase getSingleMemberShipUseCase;

  MembershipEntity membershipEntityList=const MembershipEntity(id: -1, title: "", allowProductsPerMonth: "", saleCommission: "1", tax: "", transactionCharges: "", otherCharges: "", imagesAllow: "", allowProductVideo: "", withdrawDuration: "", publicationStatus: "", createdAt: "", updatedAt: "");
  GetsinglemembershipsBloc({required this.getSingleMemberShipUseCase }) : super(Initial());

  Future<void> getSingleMemberShip(String id) async {
    emit(Loading());

    final result = await getSingleMemberShipUseCase.call(id);

    result.fold(
      (failure) {
        emit(Failure());
      },
      (entity) {
       membershipEntityList=entity;
        emit(Sucessfull());
      },
    );
  }
MembershipEntity membershipEntityListLocal(){
    return membershipEntityList;
  }
  
}
