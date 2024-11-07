import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/BlocStates/blocstates.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Branding/appcolors.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ConstStrings/ApisStrings/apiurls.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ConstStrings/AppStrings/global_strings.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ConstStrings/AssetsStrings/assetsurl.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/appelevatedbuttons.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/circularprogess.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/pageheadings.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/snackbarcutom.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ScreenSizeUtils/screensize.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Data/Models/SavedItemsModel/SubEntities/savediteminfo_model.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Data/Models/SavedItemsModel/saveditem_model.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/ItemDetailsEntity/itemdetail_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/Bids/createbuyingbids_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/cart_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/getitems_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/getsaveditems_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/getsingleitem_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/savedeletesaveitem_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/CoreWidgets/businessappbarwidet.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/Screens/masseges.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/Screens/sellerstore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../CoreWidgets/FeaturesCoreWidgets/productoverview_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String id;
  final bool? isOutOfStock;
  const ProductDetailsScreen({super.key, required this.id,this.isOutOfStock});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> with TickerProviderStateMixin {
  final list = [
    ['49%', 'Positive Ratings'],
    ['79%', 'Ship On Time'],
    ['80%', 'Chat Response Rate']
  ];
  bool isSelected = false;  


  bool loadFailed = false;

  int _selectedIndex = 0; // Track the currently selected tab

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }
 



  final _formKey = GlobalKey<FormState>();
  final _bidAmountController = TextEditingController();
  final _optionalMessageController = TextEditingController();
  double minimumBidAmount = 10.0;

  
  @override
  void initState() {
   
    


      BlocProvider.of<GetsaveditemsBloc>(context).getSavedItems();

 
    BlocProvider.of<GetsingleitemBloc>(context).getUser(widget.id);
    
    super.initState();
  }


  

  @override
  Widget build(BuildContext context) {
    final size = ScreenSizeUtil.getScreenSized(context);


    
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, size.height*.1),
          child:const BusinessAppBarWidget(),
        ),
        body: BlocBuilder<GetsingleitemBloc, BlocStates>(builder: (ctx, state) {
          var itemdetail =
              BlocProvider.of<GetsingleitemBloc>(context).getItemDetailsLocal();

          if (state is Loading) {
            return const ProgressCircularIndicatorCustom();
          }
          if (state is Sucessfull) {
            print(itemdetail.saleType);
            return SizedBox(
              height: size.height,
              child: _widget(context, size, itemdetail));
          } else {
            return SizedBox(
              height: size.height,
              child: InkWell(
                onTap: () {
                  BlocProvider.of<GetsingleitemBloc>(context)
                      .getUser(widget.id);
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
        }));
  }

  Widget _widget(
  BuildContext context, 
  Size size, 
  ItemDetailEntity itemDetailEntity
) {
  return SingleChildScrollView(
    child: Column(
      children: [
        // Product Images
             // Product Overview
             ProductImagesWidget(itemDetailEntity: itemDetailEntity,),
        _prodctOverView(context, size, itemDetailEntity),
        
        // Buttons
        _btns(context, size),
        
        
      Column(
      children: [
        _customTabBar(_selectedIndex, _onTabSelected), // Custom Tab Bar
        // Content based on selected tab
        _selectedIndex == 0 ? _shortDes(context, size) :
                  _selectedIndex == 1 ? _additonalDetails(context, size) :
                  _selectedIndex == 2 ? _reviews(context, size, itemDetailEntity) :
                 _aboutSeller(context, size, itemDetailEntity),
      ],
    ),


        // More Products Section
      //  _moreProducts(context, size, itemDetailEntity),
      ],
    ),
  );
}



Widget _customTabBar(int selectedIndex, Function(int) onTabSelected) {
  // List of tab titles
  final List<String> tabTitles = [
    'Description',
    'Details',
    'Reviews',
    'Seller Info',
  ];

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: List<Widget>.generate(tabTitles.length, (index) {
      bool isSelected = index == selectedIndex; // Check if this tab is selected

      return GestureDetector(
        onTap: () => onTabSelected(index), // Call the callback with the selected index
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.links : Colors.transparent, // Background color based on selection
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: isSelected ? AppColors.links : Colors.transparent), // Optional border for selected tab
          ),
          child: Text(
            tabTitles[index],
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: isSelected ? Colors.white : Colors.black,fontWeight: FontWeight.bold)
            
          ),
        ),
      );
    }),
  );
}
  Widget _prodctOverView(
      BuildContext context, Size size, ItemDetailEntity itemDetailEntity) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * .03, vertical: size.width * .02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.topLeft,
              child: Text(
                itemDetailEntity.itemTitle as String,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.orangeAccent, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        Expanded(
  child: Container(
    alignment: Alignment.topRight,
    child: RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Rs. ',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.orangeAccent, // Style for the currency symbol
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: itemDetailEntity.buyItNowPrice.toString(),
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              decoration: TextDecoration.underline,
              color: Colors.orangeAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  ),
),
        ],
      ),
    );
  }

  Widget _btns(BuildContext context, Size size) {
    var itemdetail =
        BlocProvider.of<GetsingleitemBloc>(context).getItemDetailsLocal();
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: size.height * .0001, vertical: size.height * .04),
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
              child: ElevatedButtonWidget(
                isSmallBtn: true,
                  bgColor: Colors.blue,
                  buttonSize: null,
                  function: () {


                    if(widget.isOutOfStock==true){

                      
                        CustomSnackbar.show(
                iconData: Icons.check_circle_outline,
                
              buildContext: context, errorheading: " Failed to add!", error: "item out of stock for now", iconColor: Colors.red);

              return;


                    }

                    BlocProvider.of<GetCartBloc>(context)
                        .addToCart(itemdetail.id as String,context)
                        .then((_) {
                          
                        

                      if (BlocProvider.of<GetCartBloc>(context).addedState ==
                          "S") {



                        CustomSnackbar.show(
                iconData: Icons.check_circle_outline,
                
              buildContext: context, errorheading: " Success!", error: "Added to Cart Successfully", iconColor: Colors.green);
                
                        
                      } else {
                        CustomSnackbar.show(
                iconData: Icons.check_circle_outline,
                
              buildContext: context, errorheading: " Failed!", error: "Failed to add item to cart try again!", iconColor: Colors.red);
                      }
                    });
                  },
                  buttonText: "Add to cart")),
          if (itemdetail.saleType == "auction")
            Expanded(flex: 1,
                child: ElevatedButtonWidget(
                   
                 isSmallBtn: true,
                    bgColor: Colors.amber,
                    buttonSize: null,
                    function: () {
                      openAlertDialog(context);
                    },
                    buttonText: "Create Offer")),
          Expanded(
              child: ElevatedButtonWidget(
                
                isSmallBtn: true,
                  bgColor: Colors.green,
                  buttonSize: null,
                  function: () {},
                  buttonText: "Buy It Now")),
        ],
      ),
    );
  }

  Widget _shortDes(BuildContext context, Size size) {
    var itemdetail =
        BlocProvider.of<GetsingleitemBloc>(context).getItemDetailsLocal();
    return Column(
      children: [
        HeadingsWidet(
          h1: "Short Description",
          alignment: Alignment.centerLeft,
          color: Colors.orangeAccent,
        ),
        SizedBox(
          height: size.height * .01,
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: itemdetail.shortDescription==null? Text(GlobalStrings.dummyData ):Text(itemdetail.shortDescription as String),
        )
      ],
    );
  }

  Widget _additonalDetails(BuildContext context, Size size) {
    var itemdetail =
        BlocProvider.of<GetsingleitemBloc>(context).getItemDetailsLocal();
    return Column(
      children: [
        SizedBox(
          height: size.height * .006,
        ),
        HeadingsWidet(
          h1: "Additional Details",
          alignment: Alignment.centerLeft,
          color: Colors.orangeAccent,
        ),
        SizedBox(
          height: size.height * .01,
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              for (int i = 0;
                  i < itemdetail.itemAdditionalInformation!.length;
                  i++)
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.height * .009,
                          vertical: size.height * .009),
                      color: AppColors.links,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        itemdetail.itemAdditionalInformation![i].title
                            as String,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                      ),
                    )),
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.height * .009,
                          vertical: size.height * .009),
                      alignment: Alignment.centerLeft,
                      color: Colors.grey.withOpacity(.2),
                      child: Text(
                        itemdetail.itemAdditionalInformation![i].value
                            as String,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ))
                  ],
                )
            ],
          ),
        )
      ],
    );
  }

 
  Widget _aboutSeller(
      BuildContext context, Size size, ItemDetailEntity itemDetailEntity) {
    var itemdetail =
        BlocProvider.of<GetsingleitemBloc>(context).getItemDetailsLocal();
    return Card(
      color: AppColors.links,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: size.height * .01,
            ),
            ListTile(
              leading: CircleAvatar(
                  radius: 80,
                  backgroundImage:
                      NetworkImage(itemdetail.user!.profileImage as String)),
              title: Text(
                itemDetailEntity.user!.name as String,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white),
              ),
              subtitle: Row(
                children: [
                  const Icon(
                    size: 10,
                    Icons.star,
                    color: Colors.amber,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    "(3.9)",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * .002,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * .003,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Row(
                        children: [
                          const Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: size.width * .01,
                          ),
                          Text(
                            "Identity Verified",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                      Expanded(
                          child: Container(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          itemdetail.user!.identityVerifiedAt == null
                              ? Icons.close
                              : Icons.check,
                          color: itemdetail.user!.identityVerifiedAt == null
                              ? Colors.redAccent
                              : Colors.green
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: size.height * .01,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Row(
                        children: [
                          const Icon(
                            Icons.phone,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: size.width * .01,
                          ),
                          Text(
                            "Phone Verified",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                      Expanded(
                          child: Container(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          itemdetail.user!.identityVerifiedAt == null
                              ? Icons.close
                              : Icons.check,
                          color: itemdetail.user!.identityVerifiedAt == null
                              ? Colors.redAccent
                              : Colors.green
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: size.height * .01,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Row(
                        children: [
                          const Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: size.width * .01,
                          ),
                          Text(
                            "Email Verified",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                      Expanded(
                          child: Container(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          itemdetail.user!.emailVerifiedAt == null
                              ? Icons.close
                              : Icons.check,
                          color: itemdetail.user!.emailVerifiedAt == null
                               ? Colors.redAccent
                              : Colors.green,
                        ),
                      )),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * .01,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * .01),
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: size.width * .05,
                    ),
                    child: ElevatedButtonWidget(
                      isSmallBtn: true,
                        bgColor: Colors.orangeAccent,
                        buttonSize: null,
                        function: () {
                          //to store

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SellerstoreScreen(
                                      isMine: false,
                                      itemDetailEntity: itemDetailEntity)));
                        },
                        buttonText: "Visit Store"),
                  )),
                  SizedBox(
                    width: size.width * .01,
                  ),
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: size.width * .05,
                    ),
                    child: ElevatedButtonWidget(
                      isSmallBtn: true,
                        bgColor: Colors.blue,
                        buttonSize: null,
                        function: () {
                          //to store
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MassegedOverView()));
                        },
                        buttonText: "Contact"),
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _reviews(
      BuildContext context, Size size, ItemDetailEntity itemDetailEntity) {
    String rev =
        "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.";
    return Card(
      child: Column(
        children: [
          HeadingsWidet(h1: "Product Reviews", alignment: Alignment.topLeft),
          SizedBox(
            height: size.height * .01,
          ),
          for (int i = 0; i < 3; i++)
            ListTile(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: size.height * .02, vertical: size.height * .02),
              leading: const CircleAvatar(
                radius: 20,
                child: Text(
                  "J",
                ),
              ),
              title: RichText(
                text: TextSpan(
                  text: "John Cena",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                      text: " 10-5-2024",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.black),
                    ),
                  ],
                ),
              ),
              subtitle: Text(
                rev,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.black),
              ),
            ),
        ],
      ),
    );
  }

  Widget _moreProducts(
      BuildContext context, Size size, ItemDetailEntity itemDetailEntity) {
    var list = BlocProvider.of<GetitemsBloc>(context).getLocalList();
    return BlocBuilder<GetitemsBloc, BlocStates>(builder: (ctx, state) {
      return Card(
        child: Column(
          children: [
            HeadingsWidet(h1: "Sponsered Items", alignment: Alignment.topLeft),
            SizedBox(
              height: size.height * .01,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: SizedBox(
                height: size.height * .329, // Fixed height for ListView
                child: ListView.builder(
                
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      list.length-20, // Adjust number of items based on your data
                  itemBuilder: (context, index) {
                    // Replace with your actual product data
              
                    return ProductOverViewWidget(
                      isHorizontal: true,
                      size: size,
                      itemEntity: list[index],
                      blocStates: state,
                    );
                  },
                ),
              ),
            )
          ],
        ),
      );
    });
  }


    // BlocConsumer<DeleteMyItemBloc,BlocStates>(builder: (ctx,state){

      
        
    //     return Stack(
    //       children: [
    //         AlertDialog(
    //         titlePadding: const EdgeInsets.symmetric(horizontal: 16,vertical: 0), // Adjusts the title padding
    //         actionsPadding: const EdgeInsets.symmetric(vertical: 5), // Reduces space between actions and content
    //         title: Center(
    //           child: HeadingsWidet(
    //             h1: 'Are you sure you want to delete?',
    //             alignment: Alignment.center,
    //           ),
    //         ),
    //         contentPadding: EdgeInsets.zero, // Removes padding around content
    //         content: const SizedBox.shrink(), // No extra content, minimal height
    //         actionsAlignment: MainAxisAlignment.center, // Centers the buttons
    //         actions: [
    //           TextButton(
    //             onPressed: () {
    //               Navigator.pop(context);
    //             },
    //             child: const Text('Cancel'),
    //           ),
    //           TextButton(
    //             onPressed: () {
    //              BlocProvider.of<DeleteMyItemBloc>(context).deleteMyItem(deleteItemId);
                
            
    //             },
    //             child: const Text('Delete'),
    //           ),
    //         ],
    //               ),

    //               if(state is Loading)
    //         const  ProgressCircularIndicatorCustom()
    //       ],
    //     );

    //   }, listener: (ctx,state){



    //     if (state is Sucessfull) {
               
               

    //                      CustomSnackbar.show(
    //             iconData: Icons.check_circle_outline,
                
    //           buildContext: context, errorheading: "Success!", error: "Item Deleted Successfully", iconColor: Colors.green);
    //           BlocProvider.of<GetMyItemsBloc>(context).deleteItem(deleteItemId);
                
    //                               Navigator.pop(context);





              
    //           } else if (state is Failure) {
    

    //           CustomSnackbar.show(
    //             iconData: Icons.error,
                
    //           buildContext: context, errorheading: "Failure!", error: "Some thing went wrong check internet connection!", iconColor: Colors.red);
                

    //              Navigator.pop(context);

    //           } else {

        



    //           }


    //   })

  Future<void> openAlertDialog(BuildContext context) async {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return BlocConsumer<CreatebuyingbidsBloc,BlocStates>(builder: (ctx,state){
        
          return Stack(children: [

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
                       var itemdetail =
        BlocProvider.of<GetsingleitemBloc>(context).getItemDetailsLocal();
                      // Handle offer creation with bid amount and optional message
                      final bidAmount = (_bidAmountController.text);
                     // final optionalMessage = _optionalMessageController.text;
                    BlocProvider.of<CreatebuyingbidsBloc>(context).createBuyingBid(itemdetail.id as String, itemdetail.buyItNowPrice.toString(), bidAmount);
                    }
                  },
                  child: const Text('Create Offer'),
                ),
              ],
            ),
                              if(state is Loading)
            const  ProgressCircularIndicatorCustom()



          ],);
        }, listener: (ctx,state){
                if (state is Sucessfull) {
               
              

                         CustomSnackbar.show(
                iconData: Icons.check_circle_outline,
                
              buildContext: context, errorheading: "Success!", error: "New Bid Created Successfully", iconColor: Colors.green);
                
                 Navigator.pop(context);




              
              } else if (state is Failure) {
    
               String msg=BlocProvider.of<CreatebuyingbidsBloc>(context).exception;
              CustomSnackbar.show(
                iconData: Icons.error,
                
              buildContext: context, errorheading: "Failure!", error: msg, iconColor: Colors.red);
                


              } else {

        



              }

        
        
        
        
        
        });
      },
    );
  }
}






class ProductImagesWidget extends StatefulWidget {

  final ItemDetailEntity itemDetailEntity;

  const ProductImagesWidget({
    super.key,
    required this.itemDetailEntity,
  });

  @override
  _ProductImagesWidgetState createState() => _ProductImagesWidgetState();
}

class _ProductImagesWidgetState extends State<ProductImagesWidget> {
  bool isSaved=false;
  bool loadFailed = false;
  int selectedImageIndex = 0; // Track selected image
  bool imageLoadingFailed = false; // Track if loading the current image failed

  @override
  Widget build(BuildContext context) {
    var itemDetail = widget.itemDetailEntity;
    // Access the item details

    Size size = MediaQuery.of(context).size;
   
    return Column(
      children: [
        Container(
          alignment: Alignment.bottomRight,
          width: double.infinity,
          height: size.height * .4,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageLoadingFailed
                  ? CachedNetworkImageProvider(AppAssetsUrl.fallbackImageUrl)
                  : CachedNetworkImageProvider('${ApiUrls.baseUrl}/${itemDetail.itemImages![selectedImageIndex].image}'),
              fit: BoxFit.cover,
              onError: (exception, stackTrace) {
                setState(() {
                  loadFailed = true; // Image loading failed
                  imageLoadingFailed = true; // Track failed image load
                });
              },
            ),
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  // Share functionality here
                },
                icon: Icon(Icons.share, color: AppColors.links),
              ),
BlocConsumer<SaveItemBloc, BlocStates>(
  builder: (ctx, state) {
    bool isSaved = false;

    // Assume `getSavedItemsLocal` returns List<SavedItemModel>
    var list = BlocProvider.of<GetsaveditemsBloc>(context).getSavedItemsLocal();

    // Check if the item is already saved
    for (var item in list) {
      if (item.itemId == itemDetail.id) {
        isSaved = true;
        break;
      }
    }

    // Print current state of isSaved
    print("Is Item Saved: $isSaved");

    // UI Handling based on state
    if (state is Loading) {
      return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: IconButton(
          icon: Icon(Icons.favorite_outline, color: AppColors.links),
          onPressed: null,
        ),
      );
    } else {
      return IconButton(
        icon: Icon(isSaved ? Icons.favorite : Icons.favorite_outline, color:isSaved? Colors.red:AppColors.links),
        onPressed: () {
          // Trigger the save/unsave logic
          BlocProvider.of<SaveItemBloc>(context).saveItem(itemDetail.id as String);
        },
      );
    }
  },
  listener: (ctx, state) {
    if (state is Sucessfull) {
      // Update the local list of saved items after success
      var list = BlocProvider.of<GetsaveditemsBloc>(context).getSavedItemsLocal();
      bool isSaved = false;

      if (list.any((item) => item.itemId == itemDetail.id)) {
        // Item is already saved, remove it (unsave)
        list.removeWhere((existingItem) => existingItem.itemId == itemDetail.id);
        isSaved = false;
      } else {
        // Item is not saved, add it to the list (save)
        list.add(SavedItemModel(
          id: "",
          createdBy: "",
          itemId: itemDetail.id as String,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          deletedAt: null,
          item: SavedItemInfoModel(
            id: "",
            createdBy: "",
            categoryId: "",
            subCategoryId: "",
            itemTitle: "",
            condition: "",
            conditionDescription: "",
            saleType: "",
            auctionDuration: "",
            quantity: 0,
            startBiddingPrice: 0.0,
            buyItNowPrice: 0.0,
            shippingPrice: 0.0,
            shippingDuration: "",
            shortDescription: "",
            videoUrl: "",
            promotion: "",
            promotionPrice: 0.0,
            promotionExpiry: "",
            publicationStatus: "",
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            deletedAt: null,
          ),
        ));
        isSaved = true;
      }

      // Force a rebuild to reflect the new isSaved state
      setState(() {});

      CustomSnackbar.show(
        iconData: Icons.check,
        buildContext: context,
        errorheading: "Success!",
        error: isSaved ? "Item saved!" : "Item unsaved!",
        iconColor: Colors.green,
      );
    }

    if (state is Failure) {
      CustomSnackbar.show(
        iconData: Icons.error,
        buildContext: context,
        errorheading: "Failure!",
        error: "An error occurred!",
        iconColor: Colors.red,
      );
    }
  },
),
            ],
          ),
        ),
        _imagesRow(context, itemDetail),
      ],
    );
  }

  Widget _imagesRow(BuildContext context, ItemDetailEntity itemDetail) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemDetail.itemImages!.length,
        itemBuilder: (ctx, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedImageIndex = index; // Update the selected image index
                imageLoadingFailed = false; // Reset image loading failed state
              });
            },
            child: Container(
              width: 50,
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: selectedImageIndex == index ? AppColors.links : Colors.grey,
                  width: 2.0,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10), // Apply the same border radius here
                child: CachedNetworkImage(
                  imageUrl: '${ApiUrls.baseUrl}/${itemDetail.itemImages![index].image}',
                  width: 50,
                  height: 60,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) {
                    return Image.asset(AppAssetsUrl.fallbackImageUrl);
                  },
                  // Shimmer effect while loading the image
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: 50,
                      height: 60,
                      color: Colors.grey[300],
                    ),
                  ),
                  // When image is loaded successfully, set imageLoadingFailed to false
                  imageBuilder: (context, imageProvider) {
                    if (selectedImageIndex == index) {
                      imageLoadingFailed = false; // Reset when the selected image is loaded
                    }
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
