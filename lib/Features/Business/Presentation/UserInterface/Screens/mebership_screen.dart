import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/BlocStates/blocstates.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/circularprogess.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/pageheadings.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/getallmemberships_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/CoreWidgets/businessappbarwidet.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/ScreenWidgets/membershipcard_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MembeShopOverViewScreen extends StatefulWidget {
  const MembeShopOverViewScreen({super.key});

  @override
  State<MembeShopOverViewScreen> createState() => _MembeShopOverViewScreenState();
}

class _MembeShopOverViewScreenState extends State<MembeShopOverViewScreen> {

  @override
  void initState() {

    BlocProvider.of<GetallmembershipsBloc>(context).getAllMemberShips();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, size.height*.1),
          child:const BusinessAppBarWidget(),
        ),
      body: BlocBuilder<GetallmembershipsBloc,BlocStates>(builder: (ctx,state){

     if (state is Loading) {
                return const ProgressCircularIndicatorCustom();
              }
     else if(state is Sucessfull){

      var list =BlocProvider.of<GetallmembershipsBloc>(context).membershipEntityListLocal();
     return Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
            ),
        child: Column(
          children: [
              HeadingsWidet(h1: 'Membership plans', alignment: Alignment.center,h2: "Choose from our different memberships to get access to more features!",),

           
            Expanded(child:  MemberShipCardWidget(list: list,)),
          ],
        ),
      );
     }
     else {
     return SizedBox(
                  height: size.height,
                  child: InkWell(
                    onTap: () {
                      BlocProvider.of<GetallmembershipsBloc>(context)
                          .getAllMemberShips();
                    },
                    child: HeadingsWidet.withH1Icon(
                      iconData: (Icons.refresh),
                      h1: "Something Went Wrong",
                      alignment: Alignment.center,
                      h2: "Tap to retry",
                    ),
                  ),
                );




     }


      }),
    );
  }
}