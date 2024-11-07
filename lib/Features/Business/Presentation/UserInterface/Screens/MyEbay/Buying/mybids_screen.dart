import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/BlocStates/blocstates.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Branding/appcolors.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ConstStrings/AssetsStrings/assetsurl.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/appelevatedbuttons.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/circularprogess.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/pageheadings.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/snackbarcutom.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ScreenSizeUtils/screensize.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/Bids/buyerbid_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/Bids/getbuyingbids_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/deletemyitem_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/myitems_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/CoreWidgets/businessappbarwidet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';


class BuyingBidsScreen extends StatefulWidget {

  const BuyingBidsScreen({super.key,});

  @override
  State<BuyingBidsScreen> createState() => _BuyingBidsScreenState();
}

class _BuyingBidsScreenState extends State<BuyingBidsScreen> {

@override
  void initState() {


   BlocProvider.of<GetbuyingbidsBloc>(context)
                      .getBuyingBids();

   

    super.initState();
  }
 final _formKey = GlobalKey<FormState>();
  final _bidAmountController = TextEditingController();
  final _optionalMessageController = TextEditingController();
  double minimumBidAmount = 10.0;

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
          body: BlocBuilder<GetbuyingbidsBloc, BlocStates>(
              builder: (ctx, state) {
              
                    
               var list=BlocProvider.of<GetbuyingbidsBloc>(context)
                      .getbidsListLocal();
           if(list.isEmpty){
            return Container(width: double.infinity,height: double.infinity,
            alignment: Alignment.center,
            child: HeadingsWidet(h1: "No items to show", alignment: Alignment.center,h2: "Create bids to create history for items",),
            );
           }

              if (state is Loading) {
                return const ProgressCircularIndicatorCustom();
              }
              if (state is Sucessfull) {
                return SingleChildScrollView(child: Column(children: [

                      
          Container(
                    padding:const EdgeInsets.all(10),
                    width: double.infinity,
                  color: Colors.grey.withOpacity(.1),
                  child:HeadingsWidet(h1: "My Bids  (${list.length})", alignment: Alignment.topLeft)),

                
                _dataTableFunction(context,size,list)


                ],));
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




  Widget _dataTableFunction(BuildContext context, Size size,List<BidEntity> product) {
    double iconSize = 20;

    return SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: DataTable(
    columnSpacing: size.width * .08, // Increases space between columns
    dataRowColor: WidgetStateProperty.all<Color>(Colors.white), // Row background color
    headingRowColor: WidgetStateProperty.all<Color>(AppColors.links), // Heading row background color
    dividerThickness: 2, // Divider between rows
    headingTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.white, // White color for header text
        ),
    dataTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Colors.black, // Default text style for data rows
        ),
    border: TableBorder.all( // Adds borders around the table cells
      color: Colors.black, // Color of the border
      width: 1, // Thickness of the border
    ),
    columns:  [

DataColumn(
  label: Row(
    children: [
    const  Text('Image'),
      const SizedBox(width: 5),
      Icon(Icons.arrow_upward, size: iconSize, color: Colors.white),
    ],
  ),
),
DataColumn(
  label: Row(
    children: [
    const  Text('Items Name'),
   const   SizedBox(width: 5),
      Icon(Icons.arrow_downward, size: iconSize, color: Colors.white),
    ],
  ),
),
DataColumn(
  label: Row(
    children: [
    const  Text('Original Price'),
    const  SizedBox(width: 5),
      Icon(Icons.arrow_upward, size: iconSize, color: Colors.white),
    ],
  ),
),
DataColumn(
  label: Row(
    children: [
   const   Text('Bid Price'),
   const   SizedBox(width: 5),
      Icon(Icons.arrow_downward, size: iconSize, color: Colors.white),
    ],
  ),
),
DataColumn(
  label: Row(
    children: [
    const  Padding(
        padding: EdgeInsets.only(left: 10),
        child: Text('Actions'),
      ),
    const  SizedBox(width: 5),
      Icon(Icons.play_arrow, size: iconSize, color: Colors.white),  // Play icon for actions
    ],
  ),
),
DataColumn(
  label: Row(
    children: [
    const  Text('Status'),
   const   SizedBox(width: 5),
      Icon(Icons.arrow_upward, size: iconSize, color: Colors.white),
    ],
  ),
),

     
    ],
    rows: [
      for (int i = 0; i < product.length; i++)
        DataRow(
          cells: [
            DataCell(
              Container(
                margin: const EdgeInsets.all(6), // Margin around the image
                width: size.width * .15,
                height: size.width * .15,
                child: CachedNetworkImage(
                  imageUrl: AppAssetsUrl.fallbackImageUrl,
                  fit: BoxFit.cover, // Ensures images fill the container
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      color: Colors.white,
                      height: size.height,
                      width: double.infinity,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            DataCell(
              Text(
                product[i].item!.itemTitle as String,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            DataCell(
              Text(
                "Rs.${product[i].originalPrice.toString()}",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
                DataCell(
              Text(
                "Rs.${product[i].bidPrice.toString()}",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),


             DataCell(
              SizedBox(
               width: 100,
               height: 50,
              
               child: ElevatedButtonWidget(bgColor: AppColors.links, buttonSize: null, isSmallBtn: true, function: (){
                                   deleteItemId=product[i].id;
           //    openAlertDialog(context);
               
               }, buttonText: "Update Bid"),
                              ),
            ),
           
             

               DataCell(
              Text(
              product[i].bidStatus=="pending"?  product[i].bidStatus.toString():"Accepted",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color:product[i].bidStatus=="pending"? Colors.red:Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),


          ],
        ),
    ],
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
          title: Text(
            'Create Offer',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _bidAmountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Bid Amount'),
                  validator: (value) {
                    if (value == null || double.tryParse(value) == null) {
                      return 'Please enter a valid bid amount';
                    }
                    if (double.parse(value) < minimumBidAmount) {
                      return 'Minimum bid amount is $minimumBidAmount';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _optionalMessageController,
                  decoration:
                      const InputDecoration(labelText: 'Optional Message'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Handle offer creation with bid amount and optional message
                  final bidAmount = double.parse(_bidAmountController.text);
                  final optionalMessage = _optionalMessageController.text;
                  Navigator.pop(context);
                }
              },
              child: const Text('Create Offer'),
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


Future<void> openAlertDialog1(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Create Offer',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _bidAmountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Bid Amount'),
                  validator: (value) {
                    if (value == null || double.tryParse(value) == null) {
                      return 'Please enter a valid bid amount';
                    }
                    if (double.parse(value) < minimumBidAmount) {
                      return 'Minimum bid amount is $minimumBidAmount';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                
                TextField(
                  controller: _optionalMessageController,
                  decoration:
                      const InputDecoration(labelText: 'Optional Message'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Handle offer creation with bid amount and optional message
                  final bidAmount = double.parse(_bidAmountController.text);
                  final optionalMessage = _optionalMessageController.text;
                  // Do something with the bid amount and optional message
                  Navigator.pop(context);
                }
              },
              child: const Text('Create Offer'),
            ),
          ],
        );
      },
    );
  }
}




