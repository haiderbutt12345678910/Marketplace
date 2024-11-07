import 'package:flutter_application_ebay_ecom/AppCores/BlocStates/blocstates.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/membership_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/UseCases/getmemberships_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetallmembershipsBloc extends Cubit<BlocStates> {
  final GetAllMembershipsUseCase getAllMembershipsUseCase;

  List<MembershipEntity> membershipEntityList=[];
  GetallmembershipsBloc({required this.getAllMembershipsUseCase, }) : super(Initial());

  Future<void> getAllMemberShips() async {
    emit(Loading());

    final result = await getAllMembershipsUseCase.call();

    result.fold(
      (failure) {
        emit(Failure());
      },
      (list) {
       membershipEntityList=list;
        emit(Sucessfull());
      },
    );
  }
  List<MembershipEntity> membershipEntityListLocal(){
    return membershipEntityList;
  }
  
}
