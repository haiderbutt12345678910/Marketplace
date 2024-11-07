import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ConstStrings/ApisStrings/apiurls.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ConstStrings/AssetsStrings/assetsurl.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/pageheadings.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/ItemsEntites/item_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/ItemsEntites/myitem_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/CoreWidgets/FeaturesCoreWidgets/shimmer_widegt.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/CoreWidgets/FeaturesCoreWidgets/tags_widegt.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/Screens/productdetails_sceen.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../../AppCores/BlocStates/blocstates.dart';

class ProductOverViewWidget extends StatefulWidget {
  final String? navId;
  final bool? isRecentlyViewd;
  final bool?    isSaved;
  final BlocStates? blocStates;
  final Size size;
  final ItemEntity? itemEntity;
  final bool? isHorizontal;
  final bool? isMine;
  final MyItemEntity? myItemEntity;

  const ProductOverViewWidget({
    this.isRecentlyViewd,
    this.isSaved,
    this.myItemEntity,
    super.key,
    this.isMine,
    this.navId,
    required this.size,
    this.blocStates,
    this.isHorizontal,
     this.itemEntity,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ProductOverViewWidgetState createState() => _ProductOverViewWidgetState();
}

class _ProductOverViewWidgetState extends State<ProductOverViewWidget> {
  // Track loading state

  @override
  void initState() {

   

    super.initState();

     

   
  


  }

 
  bool showShimmer=false;
  bool loadFailed = false;

  @override
  Widget build(BuildContext context) {
    return showShimmer
        ? SizedBox(child: ShimmerWidegt(size: widget.size))
        : _buildActualWidget();
  }

  Widget _buildActualWidget() {
    // Compare and store image URL for the product

    return widget.blocStates is Failure
        ? SizedBox(
            width: double.infinity,
            child: HeadingsWidet.withH1Icon(
              h1: "Failed To Load Data",
              alignment: Alignment.center,
              h2: "Tap here to retry",
              iconData: Icons.refresh,
            ),
          )
        : Container(
            margin: EdgeInsets.only(
                left: widget.size.height * 0.01,
                right: widget.size.height * 0.01,
                top: widget.size.height * 0.009,
                bottom: 0),
            width:widget.isHorizontal==null? widget.size.height * 0.15:widget.size.height * 0.2,
            decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8), // Circular border
            border: Border.all(
              color: Colors.grey.withOpacity(.2), // Border color
              width: 1.0, // Border width
            ),
          ),
            child: InkWell(
              onTap: () {

            bool? isOutOFStock;
if (widget.isMine == null) {
  String? itemId;

  if (widget.navId == null) {
    // Check if both widget.myItemEntity and widget.itemEntity are null
    if (widget.myItemEntity != null) {
      itemId = widget.myItemEntity!.id as String;
      isOutOFStock = true;
    } else if (widget.itemEntity != null) {
      itemId = widget.itemEntity!.id as String;
      isOutOFStock = false; // Explicitly setting it to false if itemEntity is used
    }

    

    if (itemId != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ProductDetailsScreen(id: itemId as String, isOutOfStock: isOutOFStock),
        ),
      );
    } 
  } else {
    // Similar logic for widget.navId != null case
    if (widget.myItemEntity != null) {
      itemId = widget.myItemEntity!.id as String;
      isOutOFStock = true;
    } else if (widget.itemEntity != null) {
      itemId = widget.itemEntity!.id as String;
      isOutOFStock = false;
    }

    

    if (itemId != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ProductDetailsScreen(id: itemId as String, isOutOfStock: isOutOFStock),
        ),
      );
    }
  }
} else {
  return;
}
},
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: widget.size.height * .15,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        onError: (e, s) {
                          setState(() {
                            loadFailed = true;
                          });
                        },
                        image: NetworkImage(
                          loadFailed
                              ? AppAssetsUrl.fallbackImageUrl
                              : widget.myItemEntity==null?'${ApiUrls.baseUrl}/${widget.itemEntity!.itemImages![0].imageUrl}':
                                    '${ApiUrls.baseUrl}/${widget.myItemEntity!.itemImage![0].imageUrl}'
                                  ,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    alignment: Alignment.topLeft,
                  
                  ),
                  SizedBox(
                    height: widget.size.height * .01,
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: widget.size.height * .02),
                      child: Text(
  widget.myItemEntity?.category?.categoryName ?? widget.itemEntity!.categoryEntityItemDetail!.categoryName ?? '',
  maxLines: 1,
  style: Theme.of(context).textTheme.titleMedium!.copyWith(),
),
                    ),
                  ),
                 
                 
                  SizedBox(
                    height: widget.size.height * .01,
                  ),

                 Container(
                    width: double.infinity,
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left:  widget.size.height * .02),
                      child: Text(
  widget.myItemEntity?.itemTitle ?? widget.itemEntity?.itemTitle ?? '',
  maxLines: 1,
  style: Theme.of(context).textTheme.titleLarge!.copyWith(),
),
                    ),
                  ),
                    SizedBox(
                    height: widget.size.height * .01,
                  ),


                       Padding(
                        padding: const EdgeInsets.only(left: 15),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.start, // Aligns items to the start of the row
                           children: [
                            
                             RatingBar.builder(
                              glowColor: Colors.black,
                              glowRadius: 2,
                              ignoreGestures: true,
                              unratedColor: Colors.grey,
                               initialRating: 4,
                               minRating: 1,
                               direction: Axis.horizontal,
                               allowHalfRating: true,
                               itemCount: 5,
                               itemSize: 14.0,
                               itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                               itemBuilder: (context, _) => const Icon(
                                 Icons.star,
                                 color: Colors.amberAccent,
                               ),
                               onRatingUpdate: (rating) {
                                
                               },
                             ),
                         
                              Text(
                               "(4.5)", // Replace with your desired text
                               style: Theme.of(context).textTheme.titleMedium
                             ),
                           ],
                         ),
                       ),
                           
                  SizedBox(
                    height: widget.size.height * .004,
                  ),

                                   Container(
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.only(right:widget.isHorizontal==null? 55:30,top: 3,bottom: 3),
                                    width: widget.size.width*.23,
                                     child: Row(
                                       children: [
                                        Expanded(flex: 1,
                                          
                                          child: TagsWidget(
                                            fillColor: null,
                                            text:(widget.myItemEntity?.condition ?? widget.itemEntity?.condition ?? '')
    .replaceFirstMapped(RegExp(r'^\w'), (match) => match.group(0)!.toUpperCase()),
                                            color: Colors.green,
                                            size: widget.size,
                                          )),
                                     const   SizedBox(width: 1,),
                                     
                                     
                                          if   ((widget.myItemEntity?.saleType ?? widget.itemEntity?.saleType) != 'buy_it_now')
                                           
                                            Expanded(
                                             flex: 1,
                                              child: TagsWidget(
                                               
                                                  fillColor: true,
                                                  text: "Auction",
                                                  color: Colors.red,
                                                  size: widget.size,
                                                ),
                                            ),
                                     
                               if   ((widget.myItemEntity?.saleType ?? widget.itemEntity?.saleType) == 'buy_it_now')


                                      const  Expanded(
                                             flex: 1,
                                              child: SizedBox(
                                               
                                                  
                                                ),
                                            ),
                                     
                                     
                                     
                                                            
                                     
                                     
                                       
                                       ],
                                     ),
                                   ),

                                   SizedBox(
                    height: widget.size.height * .002,
                  ),

                                   
                                          

         Container(
  alignment: Alignment.bottomRight,
  child: Padding(
    padding: EdgeInsets.only(
        right: widget.size.height * .02, bottom: 4),
    child: RichText(
      maxLines: 1,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Rs. ',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
          ),
          TextSpan(
            text: widget.myItemEntity == null
                ? widget.itemEntity!.buyItNowPrice.toString()
                : widget.myItemEntity!.buyItNowPrice == 'Rs 0'
                    ? widget.myItemEntity!.buyItNowPrice.toString()
                    : '2000',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
          ),
        ],
      ),
    ),
  ),
),
                   
              
                   
                ],
              ),
            ),
          );
  }
}













