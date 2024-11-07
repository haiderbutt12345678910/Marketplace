import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/BlocStates/blocstates.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Branding/appcolors.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/appelevatedbuttons.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ScreenSizeUtils/screensize.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/ItemDetailsEntity/itemdetail_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/ItemsEntites/item_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/getsingleitem_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/CoreWidgets/businessappbarwidet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../AppCores/CoreWidgets/pageheadings.dart';
import '../../../../../productdummy.dart';
import '../../StateMangement/Blocs/getitems_bloc.dart';
import '../CoreWidgets/FeaturesCoreWidgets/productoverview_widget.dart';

class SellerstoreScreen extends StatefulWidget {
  final String? storeName;
  final List<File>? images;
  final ItemDetailEntity itemDetailEntity;

  final bool isMine;
  const SellerstoreScreen(
      {super.key,
      required this.isMine,
      this.images,
      this.storeName,
      required this.itemDetailEntity});

  @override
  State<SellerstoreScreen> createState() => _SellerstoreScreenState();
}

class _SellerstoreScreenState extends State<SellerstoreScreen> {

  
  final list = [
    ['49%', 'Positive Ratings'],
    ['79%', 'Ship On Time'],
    ['80%', 'Chat Response Rate']
  ];

  final list2 = [
    ['not data', 'Positive Ratings'],
    ['no data', 'Ship On Time'],
    ['no data', 'Chat Response Rate']
  ];


@override
  void initState() {
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size = ScreenSizeUtil.getScreenSized(context);
    return Scaffold(
         appBar: PreferredSize(
          preferredSize: Size(double.infinity, size.height*.1),
          child:const BusinessAppBarWidget(),
        ),
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.infinity,
          height: size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _aboutSellerStore(context, size),
                SellerSearchProducts(
                  isMine: widget.isMine,
                )
              ],
            ),
          ),
        ));
  }



  Widget _aboutSellerStore(
      BuildContext context, Size size) {
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
                itemdetail.user!.name as String,
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
                      horizontal: size.width * .01,
                    ),
                    child: ElevatedButtonWidget(
                      isSmallBtn: true,
                        bgColor: Colors.blue,
                        buttonSize: null,
                        function: () {
                          //to store

                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => SellerstoreScreen(
                          //             isMine: false,
                          //             itemDetailEntity: itemdetail)));
                        },
                        buttonText: "Contact"),
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
                        bgColor: Colors.green,
                        isSmallBtn: true,
                        buttonSize: null,
                        function: () {
                          //to store
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => MassegedOverView()));
                        },
                        buttonText: "Follow"),
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
                      isSmallBtn: true,
                        bgColor: Colors.orange,
                        buttonSize: null,
                        function: () {
                          //to store
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => MassegedOverView()));
                        },
                        buttonText: "Share"),
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  
}

class SellerSearchProducts extends StatefulWidget {
  final bool isMine;

  const SellerSearchProducts({super.key, required this.isMine});

  @override
  State<SellerSearchProducts> createState() => _SellerSearchProductsState();
}

class _SellerSearchProductsState extends State<SellerSearchProducts> {
    String searchText = '';
  String selectedCatId = '';
  String hintText='';


     List<String> list = [];

  final List<String> _checkboxOptions = [
    'New Item',
    'Used Item',
    'Free Shipping',
    'Auction',
    'Price High to Low'
  ];
  final Map<String, bool> _checkboxValues = {
    'New Item': false,
    'Used Item': false,
    'Free Shipping': false,
    'Auction': false,
    'Price High to Low': false
  };
  List<String> selectedFilters=[];
   


  String _searchText = '';
  String heading = "All Products";
  String selectedFilter = 'All Products';
  final List<String> filterOptions = [
    'All Products',
    'Free Shipping',
    'Top Rated',
    'Best Selling'
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    List<ProductDummy> filteredList = _getFilteredProducts();

    return Column(
      children: [
        Card(
          shape: const RoundedRectangleBorder(),
          child: SizedBox(
            child: TextField(
              cursorColor: Colors.black,
              onChanged: (value) {
                setState(() {
                  _searchText = value;
                });
              },
              decoration: InputDecoration(
                filled: true,
                hintText: 'Search In store',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  onPressed: () {
                    _filters(context,size);
                  },
                  icon: const Icon(Icons.more_vert),
                ),
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.orangeAccent),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
        ),
        _lastSection(context, size, filteredList)
      ],
    );
  }

  void _filters(BuildContext context, Size size) {
  // Create a temporary state to hold the changes while the sheet is open
  Map<String, bool> tempCheckboxValues = Map.from(_checkboxValues);
  String tempSelectedCatId = selectedCatId;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // for allowing more space if needed
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: size.height*.01,),
               HeadingsWidet(h1: "Advance search", alignment: Alignment.center),


                SizedBox(height: size.height * .009),

                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: _checkboxOptions.map((option) {
                    return ListTile(
                      title: Text(
                        option,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontWeight: FontWeight.normal),
                      ),
                      leading: Theme(
                        data: ThemeData(
                          unselectedWidgetColor: Colors.orangeAccent,
                        ),
                        child: Checkbox(
                          value: tempCheckboxValues[option],
                          onChanged: (bool? value) {
                            setState(() {
                              tempCheckboxValues[option] = value ?? false;
                            });
                          },
                          activeColor: AppColors.links,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),

                SizedBox(height: size.height * .008),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: size.width * .01),
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: size.width * .01,
                          ),
                          child: ElevatedButtonWidget(
                              bgColor: Colors.blueAccent,
                              buttonSize: null,
                              function: () {
                                // When Apply is pressed, update the original values and close the sheet
                                setState(() {
                                  _checkboxValues.clear();
                                  _checkboxValues.addAll(tempCheckboxValues);
                                  selectedCatId = tempSelectedCatId;
                                });
                                Navigator.of(context).pop(); // Close the bottom sheet
                              },
                              buttonText: "Apply"),
                        ),
                      ),
                      SizedBox(
                        width: size.width * .03,
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: size.width * .01,
                          ),
                          child: ElevatedButtonWidget(
                              bgColor: Colors.redAccent,
                              buttonSize: null,
                              function: () {
                                // Reset all temporary values
                                setState(() {
                                  tempCheckboxValues = {
                                    'New Item': false,
                                    'Used Item': false,
                                    'Free Shipping': false,
                                    'Auction': false,
                                    'Price High to Low': false
                                  };
                                  tempSelectedCatId = '';
                                });
                              },
                              buttonText: "Reset"),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  ).whenComplete(() {
    // Do nothing when the sheet is closed without pressing Apply
  });
}


  

  Widget _lastSection(
      BuildContext context, Size size, List<ProductDummy> filterdlist) {
    if (widget.isMine) {
      return Center(
          child: HeadingsWidet(
        h1: "No Product Found ",
        alignment: Alignment.center,
        h2: "Try Searching Again",
      ));
    }
    if (filterdlist.isEmpty) {
      return Center(
          child: HeadingsWidet(
        h1: "No Product Found ",
        alignment: Alignment.center,
        h2: "Try Searching Again",
      ));
    }

    return _products(context, size, filterdlist);
  }

  Widget _products(BuildContext context, Size size, var list) {
    List<ItemEntity> list =
        BlocProvider.of<GetitemsBloc>(context).getLocalList();
    return BlocBuilder<GetitemsBloc, BlocStates>(builder: (ctx, state) {
      return Column(
        children: [
          for (int i = 0; i < list.length / 3; i++)
            SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                      child: ProductOverViewWidget(
                          size: size, blocStates: state, itemEntity: list[i])),
                  SizedBox(
                    width: size.width * .01,
                  ),
                  Expanded(
                      child: ProductOverViewWidget(
                          size: size,
                          blocStates: state,
                          itemEntity: list[i + 1])),
                  SizedBox(
                    width: size.width * .01,
                  ),
                ],
              ),
            )
        ],
      );
    });
  }

  List<ProductDummy> _getFilteredProducts() {
    // First filter by the selected filter.
    List<ProductDummy> filteredBySelectedFilter = productList.where((product) {
      switch (selectedFilter) {
        case 'Free Shipping':
          return product.isFreeShipping ?? false;
        case 'Top Rated':
          return product.rating != null && product.rating! >= 4.5;
        case 'Best Selling':
          return product.soldItems != null &&
              int.tryParse(product.soldItems!) != null &&
              int.parse(product.soldItems!) > 100;
        default:
          return true;
      }
    }).toList();

    // Then filter the resulting list by the search text.
    return filteredBySelectedFilter.where((product) {
      // Check if the first 5 words of the title contain the search text.
      return _searchText.isEmpty ||
          _getFirstWords(product.title!)
              .toLowerCase()
              .contains(_searchText.toLowerCase());
    }).toList();
  }

  String _getFirstWords(String text, {int count = 5}) {
    List<String> words = text.split(' ');
    int length = words.length < count ? words.length : count;
    return words.take(length).join(' ');
  }
}
