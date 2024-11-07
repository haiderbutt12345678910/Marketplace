import 'dart:io';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Branding/appcolors.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/appelevatedbuttons.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/pageheadings.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/snackbarcutom.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ScreenSizeUtils/screensize.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/ItemDetailsEntity/itemdetail_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/getcategories_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/getsubcategories_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/CoreWidgets/businessappbarwidet.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/Screens/sellerstore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class StoreSetupForm extends StatefulWidget {
  const StoreSetupForm({super.key});

  @override
  State<StoreSetupForm> createState() => _StoreSetupFormState();
}

class _StoreSetupFormState extends State<StoreSetupForm> {
  final TextEditingController _itemDetailsController = TextEditingController();
  final SingleSelectController<String?> _conditionController =
      SingleSelectController(null);
  final SingleSelectController<String?> _itemCategoryController =
      SingleSelectController(null);

  final SingleSelectController<String?> _itemSubCategoryController =
      SingleSelectController(null);

  final SingleSelectController<String?> _itemSaleTypeController =
      SingleSelectController(null);

  final SingleSelectController<String?> _auctionDurationController =
      SingleSelectController(null);
  final SingleSelectController<String?> _shippingDurationConroller =
      SingleSelectController(null);

  final TextEditingController _descriptiontextEditingController =
      TextEditingController();

  final TextEditingController _startBidPrcie = TextEditingController();
  final TextEditingController _buyItNowPrice = TextEditingController();
  final TextEditingController _shippingPrice = TextEditingController();

  final TextEditingController _pricetextEditingController =
      TextEditingController();
  final TextEditingController _discounttextEditingController =
      TextEditingController();

  
  final PageController _pageController = PageController();
  File? image;
  File? coverPhoto;
  int currentIndex = 0;

  @override
  void dispose() {
    _conditionController.dispose();
    _itemCategoryController.dispose();
    _itemSubCategoryController.dispose();
    _itemSaleTypeController.dispose();
    _auctionDurationController.dispose();
    _shippingDurationConroller.dispose();
    _pricetextEditingController.dispose();
    _discounttextEditingController.dispose();
    _pageController.dispose();
    _descriptiontextEditingController.dispose();
    _itemDetailsController.dispose();

    for (var controllers in _addtionalInfoControllers) {
    for (var controller in controllers) {
      controller.dispose();
    }
  }
    super.dispose();
  }

 final List<List<TextEditingController>> _addtionalInfoControllers=[[TextEditingController(),TextEditingController()]];
  final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>(); // Create a GlobalKey
  final List<String> list = ["Step 1", "Step 2", "Step 3", "Finished"];

  @override
  Widget build(BuildContext context) {
    final size = ScreenSizeUtil.getScreenSized(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      key: _scaffoldKey,
     appBar: PreferredSize(
          preferredSize: Size(double.infinity, size.height*.1),
          child:const BusinessAppBarWidget(),
        ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Column(
            children: [
              
             
              steps(context, size),
              Expanded(
                child: SizedBox(
                  child: PageView(
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    controller: _pageController,
                    children: [
                      _itemInfo(context, size),
                      _pricing(context, size),
                      _itemAdditionalInfo(context,size),
                      _coverPhoto(context, size),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .01,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget steps(BuildContext context, Size size) {
    return SizedBox(
      width: size.width,
      child: Row(
        children: [
          for (int i = 0; i < list.length; i++)
            Expanded(
              child: Container(

                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                    vertical: size.height * .02, horizontal: size.height * .03),
                color: currentIndex == i
                    ? AppColors.links
                    : Colors.grey.withOpacity(.6),
                child: Text(
                  list[i],
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white,fontWeight: FontWeight.bold),
                ),
              ),
            )
        ],
      ),
    );
  }

  Widget _dropdowns(BuildContext context, Size size, List<String> list,
      String hint, SingleSelectController<String?>? controller) {
    return Column(
      children: [
        Container(
            width: double.infinity,
            alignment: Alignment.topLeft,
            child: Text(
              hint,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold,color: Colors.black),
            )),
        const SizedBox(
          height: 8,
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: size.width * 0,
          ),
          child: CustomDropdown<String>(
            controller: controller,
            hintText: hint,
            items: list,
            decoration: CustomDropdownDecoration(
              closedBorder: const Border(
                bottom: BorderSide(color: Colors.black, width: 1.0),
                top: BorderSide(color: Colors.black, width: 1.0),
                right: BorderSide(color: Colors.black, width: 1.0),
                left: BorderSide(color: Colors.black, width: 1.0),
              ),
              expandedBorder: const Border(
                bottom: BorderSide(color: Colors.black, width: 1.0),
                top: BorderSide(color: Colors.black, width: 1.0),
                right: BorderSide(color: Colors.black, width: 1.0),
                left: BorderSide(color: Colors.black, width: 1.0),
              ),
              closedBorderRadius: BorderRadius.zero,
              expandedBorderRadius: BorderRadius.zero,
              hintStyle: Theme.of(context).textTheme.titleMedium,
            ),
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }

  Widget _pricing(BuildContext context, Size size) {
    String days = "days";
    return SizedBox(
      height: size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HeadingsWidet(h1: "Pricing", alignment: Alignment.center),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: size.height * .02),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * .04,
                ),
              ],
            ),
          ),
          Row(
            children: [
              if(_itemSaleTypeController.value=="Buy It Now")
              Expanded(
                child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(
                      horizontal: size.height * .03,
                    ),
                    child: _textFeild(_startBidPrcie, "Enter Price", 100,
                        TextInputType.number, "Start Bid Price")),
              ),
              SizedBox(
                width: size.width * .01,
              ),
              Expanded(
                child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(
                      horizontal: size.height * .03,
                    ),
                    child: _textFeild(_buyItNowPrice, "Enter Price", 100,
                        TextInputType.number, "Buy Now Price")),
              ),
              SizedBox(
                width: size.width * .01,
              ),
              Expanded(
                child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(
                      horizontal: size.height * .03,
                    ),
                    child: _textFeild(_shippingPrice, "Enter Price", 100,
                        TextInputType.number, "Shipping Price")),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: size.height * .03, vertical: size.height * .02),
            width: size.width,
            child: Row(
              children: [
                Expanded(
                    child: _dropdowns(
                        context,
                        size,
                        ["3$days", "7$days", "10$days", "15$days"],
                        "Auction Duration",
                        _auctionDurationController)),
                SizedBox(
                  width: size.width * .02,
                ),
                Expanded(
                    child: _dropdowns(
                        context,
                        size,
                        ["3$days", "7$days", "10$days", "15$days"],
                        "shipping Duration",
                        _shippingDurationConroller)),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: size.width * .05),
            width: double.infinity,
            child: Row(
              children: [
                if (currentIndex != 0)
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: size.width * .01,
                    ),
                    child: ElevatedButtonWidget(
                        bgColor: Colors.blue,
                        buttonSize: null,
                        function: () {
                          //to store
                          _toPreviousPage();
                        },
                        buttonText: "Previous"),
                  )),
                SizedBox(
                  width: size.width * .03,
                ),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: size.width * .01,
                  ),
                  child: ElevatedButtonWidget(
                      bgColor: Colors.blueAccent,
                      buttonSize: null,
                      function: () {
                        if(_itemSaleTypeController.value == "Buy It Now"){

                          _startBidPrcie.text ="";
                        }

                         bool isValid = _shippingDurationConroller.hasValue &&
                                          _auctionDurationController.hasValue &&
                                               _buyItNowPrice.text.isNotEmpty &&
                                                 _shippingPrice.text.isNotEmpty;

                         if (_itemSaleTypeController.value != "Buy It Now") {
                            isValid = isValid && _startBidPrcie.text.isEmpty;
                                                                            }

                           if (isValid) {
                                _toNextPage();
                                     } else {
                               showMySnackBar(context, "All Feilds are required");
                                          }
                     
                      },
                      buttonText: "Next"),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemInfo(BuildContext context, Size size) {
    var getCategories =
        BlocProvider.of<GetCategoriesBloc>(context).getLocalList();
    var getSubCategories =
        BlocProvider.of<GetSubCategoriesBloc>(context).getLocalListSubCats();
       

    List<String> catList = [];
    for (int i = 0; i < getCategories.length; i++) {
      catList.add(getCategories[i].categoryName as String);
    }

    List<String> subcatlist = [];
    for (int i = 0; i < getSubCategories.length; i++) {
      subcatlist.add(getSubCategories[i].subCategoryName );
    }

    return SizedBox(
      height: size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          Padding(
            padding:const EdgeInsets.symmetric(horizontal: 20),
            child: HeadingsWidet(h1: "Item Information",
            h2: "Provide specifics info that matches your need to item products",
             alignment: Alignment.center),
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: size.height * .004),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * .04,
                ),
              ],
            ),
          ),
          Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                horizontal: size.height * .03,
              ),
              child: _textFeild(_itemDetailsController, "Shoes, Stone ,Bage",
                  100, TextInputType.emailAddress, "Item Title")),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: size.height * .03, vertical: size.height * .02),
            width: size.width,
            child: Row(
              children: [
                Expanded(
                    child: _dropdowns(context, size, catList, "Item Catergory",
                        _itemCategoryController)),
                SizedBox(
                  width: size.width * .02,
                ),
                Expanded(
                    child: _dropdowns(context, size, subcatlist,
                        "Item Sub Catergory", _itemSubCategoryController)),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: size.height * .03, vertical: size.height * .02),
            width: size.width,
            child: Row(
              children: [
                Expanded(
                    child: _dropdowns(context, size, ["New", "Used", "Open Box"],
                        "Condtion", _conditionController)),
                SizedBox(
                  width: size.width * .02,
                ),
                Expanded(
                    child: _dropdowns(context, size, ["Buy It Now", "auction"],
                        "Sale Type", _itemSaleTypeController)),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: size.width * .05),
            width: double.infinity,
            child: Row(
              children: [
                if (currentIndex != 0)
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: size.width * .01,
                    ),
                    child: ElevatedButtonWidget(
                        bgColor: Colors.blue,
                        buttonSize: null,
                        function: () {
                          //to store
                          _toPreviousPage();
                        },
                        buttonText: "Previous"),
                  )),
                SizedBox(
                  width: size.width * .03,
                ),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: size.width * .01,
                  ),
                  child: ElevatedButtonWidget(
                      bgColor: Colors.blue,
                      buttonSize: null,
                      function: () {
                        if (_itemDetailsController.text.isNotEmpty && _itemCategoryController.hasValue && _itemSubCategoryController.hasValue 
                           && _itemSaleTypeController.hasValue && _conditionController.hasValue
                        
                          ) {
                          _toNextPage(); 

                        } else {
       CustomSnackbar.show(
                iconData: Icons.check,
                
              buildContext: context, errorheading: "All feilds are required!", error: "", iconColor: Colors.red);
                                        }
                      },
                      buttonText: "Next"),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _textFeild(TextEditingController textEditingController, String hint,
      int maxLenght, TextInputType textInputType, String label) {
    return Column(
      children: [
        Container(
            width: double.infinity,
            alignment: Alignment.topLeft,
            child: Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold,color: Colors.black),
            )),
        const SizedBox(
          height: 8,
        ),
        TextField(
          
          cursorHeight: 30,
          cursorColor: AppColors.cursorColor,
          textAlign: TextAlign.left,
          keyboardType: textInputType,
          controller: textEditingController,
          decoration: InputDecoration(
            hintStyle: Theme.of(context).textTheme.titleSmall,
              hintText: hint,
          ),
         
        ),
      ],
    );
  }

  void showMySnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Colors.black),
        ),
        action: SnackBarAction(
          label: 'Error',
          onPressed: () {
            // Perform undo action (optional)
          },
        ),
        duration: const Duration(
            seconds:
                3), // Duration for which the SnackBar is visible (optional)
      ),
    );
  }

  void _toPreviousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void _toNextPage() {
    _pageController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  // Widget _logo(BuildContext context, Size size) {
  //   return SizedBox(
  //     height: size.height,
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         Container(
  //           width: double.infinity,
  //           alignment: Alignment.center,
  //           margin: EdgeInsets.symmetric(vertical: size.height * .1),
  //           child: Column(
  //             children: [
  //               SizedBox(
  //                 height: size.height * .1,
  //               ),
  //               HeadingsWidet(
  //                   h1: "Provide Logo For Store ",
  //                   h2: "images should be 128x128 with max resolutions",
  //                   alignment: Alignment.center),
  //             ],
  //           ),
  //         ),
  //         InkWell(
  //           onTap: () {
  //             getFromGallery();
  //           },
  //           child: CircleAvatar(
  //               backgroundColor: Colors.white,
  //               radius: 50.0,
  //               backgroundImage: image != null
  //                   ? FileImage(File(image!.path))
  //                   : const NetworkImage(
  //                           "https://tse1.mm.bing.net/th?id=OIP.tfaSK3pwhLrecMjEcbcA9gHaHa&pid=Api&P=0&h=220")
  //                       as ImageProvider),
  //         ),
  //         Container(
  //           width: double.infinity,
  //           margin: EdgeInsets.symmetric(horizontal: size.height * .01),
  //           child: ElevatedButtonWidget(
  //               bgColor: Colors.orangeAccent,
  //               buttonSize: null,
  //               function: () {
  //                 if (image != null) {
  //                   _toNextPage();
  //                 } else {
  //                   showMySnackBar(context, "Please provide Logo");
  //                 }
  //               },
  //               buttonText: "Proceed"),
  //         ),
  //       ],
  //     ),
  //   );
  // }

Widget _itemAdditionalInfo(BuildContext context,Size size){

   
   

    return SizedBox(
      height: size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HeadingsWidet(h1: "Additional Information", alignment: Alignment.center,
          h2: "Provide Addiotnal Info about the product like product specifications",),
          SizedBox(height: size.height*.009,),
          for(int i=0;i<_addtionalInfoControllers.length;i++)
         
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: size.height * .009,vertical: size.height*.01 ),
            width: size.width,
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                    child: _textFeild(_addtionalInfoControllers[i][0], "Brand Name, Varanty,Color,Size..",100,TextInputType.streetAddress
                    ,"Title"
                        )),
                SizedBox(
                  width: size.width * .02,
                ),
                Expanded(
                  flex: 5,
                child: _textFeild(_addtionalInfoControllers[i][1], "Bonanza,7days,red,xxl....",100,TextInputType.streetAddress
                    ,"Value"
                        )),
                if(i==0)
                Expanded(flex: 0,
                  
                  child: IconButton(onPressed: (){
                   if(_addtionalInfoControllers.length<5){
                    _addtionalInfoControllers.add([TextEditingController(),TextEditingController()]);
                     setState(() {
                       
                     });
                   }
                   else{
                    showMySnackBar(context, "Cannot add more than 5");
                   }
                
                }, icon: const Icon(Icons.add,color: Colors.green,))),   
              
                 if(i!=0)
                Expanded(
                  flex: 0,
                  child: IconButton(onPressed: (){
                
                   _addtionalInfoControllers.removeAt(i);
                   setState(() {
                     
                   });
                
                }, icon: const Icon(Icons.delete,color: Colors.red,)))   
              
                
              ],
            ),
          ),
         
          Container(
            margin: EdgeInsets.symmetric(horizontal: size.width * .05),
            width: double.infinity,
            child: Row(
              children: [
                if (currentIndex != 0)
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: size.width * .01,
                    ),
                    child: ElevatedButtonWidget(
                        bgColor: Colors.blue,
                        buttonSize: null,
                        function: () {
                          //to store
                          _toPreviousPage();
                        },
                        buttonText: "Previous"),
                  )),
                SizedBox(
                  width: size.width * .03,
                ),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: size.width * .01,
                  ),
                  child: ElevatedButtonWidget(
                      bgColor: Colors.blueAccent,
                      buttonSize: null,
                      function: () {
                        bool allFieldsNotEmpty = true;

                 for (var controllers in _addtionalInfoControllers) {
                    for (var controller in controllers) {
                        if (controller.text.isEmpty) {
                         allFieldsNotEmpty = false;  // Mark as false if any field is empty
                                         break;
                                                  }
                                                 }
                                if (!allFieldsNotEmpty) break;  // Stop checking if an empty field is found
                                               }

                         if (allFieldsNotEmpty) {
                                   _toNextPage();  // Proceed to the next page if all fields are not empty
                                             } else {
                               showMySnackBar(context, "All feilds are required.");
                                                  }
                                       },
                      buttonText: "Next"),
                )),
              ],
            ),
          ),
        ],
      ),
    );



}
  Widget _coverPhoto(BuildContext context, Size size) {
    return SizedBox(
      height: size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: size.height * .1),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * .1,
                ),
                HeadingsWidet(
                    h1: "Provide Cover Photo For Store ",
                    h2: "images should be 512x512 with max resolutions",
                    alignment: Alignment.center),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              getFromGalleryCover();
            },
            child: Container(
              width: double.infinity,
              height: size.height * .2,
              margin: EdgeInsets.symmetric(horizontal: size.width * .05),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: coverPhoto != null
                          ? FileImage(File(coverPhoto!.path))
                          : const NetworkImage(
                                  "https://tse1.mm.bing.net/th?id=OIP.tfaSK3pwhLrecMjEcbcA9gHaHa&pid=Api&P=0&h=220")
                              as ImageProvider,
                      fit: BoxFit.contain)),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: size.height * .01),
            child: ElevatedButtonWidget(
                bgColor: Colors.orangeAccent,
                buttonSize: null,
                function: () {
                  if (coverPhoto != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SellerstoreScreen(
                                isMine: true,
                                images: [image as File, coverPhoto as File],
                                storeName: _itemDetailsController.text,
                                itemDetailEntity: const ItemDetailEntity(),
                              )),
                    );
                  } else {
                    showMySnackBar(context, "Please provide Logo");
                  }
                },
                buttonText: "Go Live"),
          ),
        ],
      ),
    );
  }

  getFromGallery() async {
    try {
      XFile? pickedFile = await ImagePicker().pickImage(
        imageQuality: 10,
        source: ImageSource.gallery,
        maxWidth: 512,
        maxHeight: 512,
      );
      if (pickedFile != null) {
        setState(() {
          image = File(pickedFile.path);
        });
      }
      // ignore: empty_catches
    } catch (e) {}
  }

  getFromGalleryCover() async {
    try {
      XFile? pickedFile = await ImagePicker().pickImage(
        imageQuality: 10,
        source: ImageSource.gallery,
        maxWidth: 512,
        maxHeight: 512,
      );
      if (pickedFile != null) {
        setState(() {
          coverPhoto = File(pickedFile.path);
        });
      }
      // ignore: empty_catches
    } catch (e) {}
  }
}
