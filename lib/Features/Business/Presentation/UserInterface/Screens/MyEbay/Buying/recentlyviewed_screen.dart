import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/BlocStates/blocstates.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ConstStrings/AssetsStrings/assetsurl.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/appelevatedbuttons.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/circularprogess.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/pageheadings.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ScreenSizeUtils/screensize.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/ItemsEntites/item_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/getitems_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/getrecentlyviewed_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/CoreWidgets/businessappbarwidet.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/Screens/productdetails_sceen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class RecentlyViewedScreen extends StatefulWidget {
  const RecentlyViewedScreen({super.key,});

  @override
  State<RecentlyViewedScreen> createState() => _RecentlyViewedScreenState();
}

class _RecentlyViewedScreenState extends State<RecentlyViewedScreen> {

@override
  void initState() {

    BlocProvider.of<GetRecentlyViewditemsBloc>(context).getRecentItems();

   
   

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  
    final size = ScreenSizeUtil.getScreenSized(context);
    return 
        Scaffold(


          appBar: PreferredSize(
          preferredSize: Size(double.infinity, size.height*.1),
          child:const BusinessAppBarWidget(),
        ),

          body: Container(height: size.height,
            color: Colors.grey.withOpacity(.1),
            child: BlocBuilder<GetRecentlyViewditemsBloc, BlocStates>(
                builder: (ctx, state) {
                var savedListLocal =
                    BlocProvider.of<GetRecentlyViewditemsBloc>(context)
                        .getSavedItemsLocal();
            
                var list = BlocProvider.of<GetitemsBloc>(context)
                    .getLocalListRecentlyVied(savedListLocal);


                    
            
                if (state is Loading) {
                  return const ProgressCircularIndicatorCustom();
                }



                  if(savedListLocal.isEmpty){
                     return Container(width: double.infinity,
                     alignment: Alignment.center,
                     height: double.infinity,
                     child: HeadingsWidet(h1: "No items were viewed ", alignment: Alignment.center,
                     h2: "Get access to recently visited  items direclty from here",
                     
                     ),);


                    }
                if (state is Sucessfull) {
                    return SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(padding: const EdgeInsets.only(left: 10,
                        
                        ),child: HeadingsWidet(h1: "My recent items", alignment: Alignment.topLeft),),
                    
                       for (int i = 0; i < list.length; i++)
                         _buildProductItem(context, size, i, list)
                      ],
                    ),
                  );
                } else {
                  return SizedBox(
                    height: size.height,
                    child: InkWell(
                      onTap: () {
                        BlocProvider.of<GetRecentlyViewditemsBloc>(context)
                            .getRecentItems();
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
          ),
        );
      
  }

  

  Widget _buildProductItem(BuildContext context, Size size, int index, List<ItemEntity> list) {
   

   return Container(
    margin:const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
     child: Card(
       child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Leading Image
          Container(
            padding: const EdgeInsets.all(10),
            color: Colors.grey.withOpacity(.3),
            width: size.width * 0.3,
            height: size.width * 0.25,
            child: Image.network(
              AppAssetsUrl.fallbackImageUrl,
              width: size.width * 0.2,
              height: size.width * 0.2,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(width: size.width * 0.04), // Space between image and details
          // Title and Category Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 SizedBox(height: size.height*.01,),
     
                Text(
                  list[index].itemTitle as String,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                 
                 SizedBox(height: size.height*.01,),
     
                   Text(
                  list[index].categoryEntityItemDetail!.categoryName as String,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                ),
                            SizedBox(height: size.height*.03,),
     
                Text(
            'RS ${list[index].buyItNowPrice.toString()}',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.amber),
            overflow: TextOverflow.ellipsis,
          ),
              ],
            ),
          ),
      
          Column(
        children: [
          
          
     
      Padding(
        padding:const EdgeInsets.only(top: 50),
        child: SizedBox(width: size.height*.13,
        
        height: size.height*.06,
        
        child: ElevatedButtonWidget(
          isSmallBtn: true,
          buttonSize: null, function: (){
        
          
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  ProductDetailsScreen(id: list[index].id as String,)),
                    );
                    
        
        }, buttonText: "Buy now"),
        
        ),
      )
        ],
      ),
      
        ],
      ),
       ),
     ),
   );



  }


  Widget _searchWidget(BuildContext context, Size size) {
    return SizedBox(
            child: TextField(
              cursorColor: Colors.black,
              onChanged: (value) {
                setState(() {
                //  _searchText = value;
                });
              },
              decoration:const InputDecoration(
                filled: true,
                hintText: 'Search in recently viewed products',
                prefixIcon:  Icon(Icons.search),
               
                border:  UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.orangeAccent),
                ),
                focusedBorder:  UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder:  UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          );
  }
}
