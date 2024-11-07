import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/BlocStates/blocstates.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ConstStrings/AssetsStrings/assetsurl.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/appelevatedbuttons.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/circularprogess.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/pageheadings.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/snackbarcutom.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ScreenSizeUtils/screensize.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/ItemsEntites/myitem_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/deletemyitem_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/myitems_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/CoreWidgets/businessappbarwidet.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/Screens/productdetails_sceen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MyitemsScreen extends StatefulWidget {

  const MyitemsScreen({super.key,});

  @override
  State<MyitemsScreen> createState() => _MyitemsScreenState();
}

class _MyitemsScreenState extends State<MyitemsScreen> {

@override
  void initState() {

    BlocProvider.of<GetMyItemsBloc>(context).getMyItems();

   
   

    super.initState();
  }

  String deleteItemId='';

  @override
  Widget build(BuildContext context) {
  
    final size = ScreenSizeUtil.getScreenSized(context);
    return 
        Scaffold(
 appBar: PreferredSize(
          preferredSize: Size(double.infinity, size.height*.1),
          child:const BusinessAppBarWidget(),
        ),
          body: BlocBuilder<GetMyItemsBloc, BlocStates>(
              builder: (ctx, state) {
              var savedListLocal =
                  BlocProvider.of<GetMyItemsBloc>(context)
                      .getSavedItemsLocal();
             
              if (state is Loading) {
                return const ProgressCircularIndicatorCustom();
              }
              if (state is Sucessfull) {

                       
                 if(savedListLocal.isEmpty){
            return Container(width: double.infinity,height: double.infinity,
            alignment: Alignment.center,
            child: HeadingsWidet(h1: "No items to show", alignment: Alignment.center,h2: "Start selling to create history for items",),
            );
           }
                return  SingleChildScrollView(
                  child: Column(children: [
                    
                  Container(
                    padding:const EdgeInsets.all(10),
                    width: double.infinity,
                  color: Colors.grey.withOpacity(.2),
                  child:HeadingsWidet(h1: "My all items (${savedListLocal.length})", alignment: Alignment.topLeft),


                  ),
                  for (int i = 0; i < savedListLocal.length; i++)



                                 _buildProductItem(context,size,i,savedListLocal)
                  
                  ],),
                ) ;
              } else {
                return SizedBox(
                  height: size.height,
                  child: InkWell(
                    onTap: () {
                      BlocProvider.of<GetMyItemsBloc>(context)
                          .getMyItems();
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




 Widget _buildProductItem(BuildContext context, Size size, int index, List<MyItemEntity> list) {
   

   return Container(
    margin:const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
     child: Card(
       child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
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
                  list[index].category!.categoryName as String,
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
         
             SizedBox(width: 90,
      height: 40,
      child: ElevatedButtonWidget(
        isSmallBtn: true,
        bgColor: Colors.red,
        buttonSize: null, function: (){
         
          deleteItemId=list[index].id as String;
                  openAlertDialog(context);
                  
      
      }, buttonText: "Delete"),
      
      ),
     
      SizedBox(width: 90,
      height: 40,
      child: ElevatedButtonWidget(
        isSmallBtn: true,
        
        buttonSize: null, function: (){
      
        
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  ProductDetailsScreen(id: list[index].id as String,)),
                  );
                  
      
      }, buttonText: "Buy now"),
      
      )
        ],
      ),
      
        ],
      ),
       ),
     ),
   );



  }



  


Future<void> openAlertDialog(BuildContext context) async {
  return showDialog(
    barrierDismissible:false,
    context: context,
    builder: (BuildContext context) {


    return  BlocConsumer<DeleteMyItemBloc,BlocStates>(builder: (ctx,state){

      
        
        return Stack(
          children: [
            AlertDialog(
            titlePadding: const EdgeInsets.symmetric(horizontal: 16,vertical: 0), // Adjusts the title padding
            actionsPadding: const EdgeInsets.symmetric(vertical: 5), // Reduces space between actions and content
            title: Center(
              child: HeadingsWidet(
                h1: 'Are you sure you want to delete?',
                alignment: Alignment.center,
              ),
            ),
            contentPadding: EdgeInsets.zero, // Removes padding around content
            content: const SizedBox.shrink(), // No extra content, minimal height
            actionsAlignment: MainAxisAlignment.center, // Centers the buttons
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                 BlocProvider.of<DeleteMyItemBloc>(context).deleteMyItem(deleteItemId);
                
            
                },
                child: const Text('Delete'),
              ),
            ],
                  ),

                  if(state is Loading)
            const  ProgressCircularIndicatorCustom()
          ],
        );

      }, listener: (ctx,state){



        if (state is Sucessfull) {
               
               

                         CustomSnackbar.show(
                iconData: Icons.check_circle_outline,
                
              buildContext: context, errorheading: "Success!", error: "Item Deleted Successfully", iconColor: Colors.green);
              BlocProvider.of<GetMyItemsBloc>(context).deleteItem(deleteItemId);
                
                                  Navigator.pop(context);





              
              } else if (state is Failure) {
    

              CustomSnackbar.show(
                iconData: Icons.error,
                
              buildContext: context, errorheading: "Failure!", error: "Some thing went wrong check internet connection!", iconColor: Colors.red);
                

                 Navigator.pop(context);

              } else {

        



              }


      });
     
    },
  );
}

  
}
