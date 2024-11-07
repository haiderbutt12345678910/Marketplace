
import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Branding/appcolors.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/appelevatedbuttons.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/pageheadings.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ScreenSizeUtils/screensize.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/getcategories_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/getitems_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/CoreWidgets/businessappbarwidet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../CoreWidgets/FeaturesCoreWidgets/productoverview_widget.dart';

class ProductsOverview extends StatefulWidget {
  final String? catId;
  final int? scrollIndex;
  const ProductsOverview({super.key, 
  this.scrollIndex,
    this.catId
  });

  @override
  State<ProductsOverview> createState() => _ProductsOverviewState();
}

class _ProductsOverviewState extends State<ProductsOverview> {
  String searchText = '';
  String selectedCatId = '';
  String hintText='';

  int scrollindex=0;
     List<String> list = ["All"];

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
   

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  

    var catlist = BlocProvider.of<GetCategoriesBloc>(context).getLocalList();
      for (int i = 0; i < catlist.length; i++) {
      list.add(catlist[i].categoryName as String);
    }

    if(widget.catId==null){


   
  selectedCatId=list[0];

   hintText=list[0];

    }else{
  selectedCatId=widget.catId as String;
   hintText=widget.catId as String;


    }

WidgetsBinding.instance.addPostFrameCallback((_) {
    if (widget.scrollIndex != null) {
      scrollindex = widget.scrollIndex as int;
      _scrollToIndex(scrollindex);
    }
  });

   
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = ScreenSizeUtil.getScreenSized(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, size.height*.08),
          child:const BusinessAppBarWidget(),
        ),
      body: _widget(context, size));
  }

  Widget _searchWidget(BuildContext context, Size size) {
    return Padding(
  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
  
  child: TextField(
    cursorColor: Colors.black,
    onChanged: (value) {
      setState(() {
        searchText = value;
      });
    },
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 12),
      suffixIcon: IconButton(
        onPressed: () {
          _filters(context, size);
        },
        icon: const Icon(Icons.more_vert),
      ),
      fillColor: Colors.white.withOpacity(.5),
      filled: true,
      hintText: 'Search in $hintText',
      prefixIcon: const Icon(Icons.search),
      border: InputBorder.none,
    ),
  ),
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

  Widget _categoryFilter(BuildContext context, Size size) {
  return Column(
    children: [
    Padding(
      padding:const EdgeInsets.only(left: 10),
        child: HeadingsWidet(
              h1: "All Categories",
              alignment: Alignment.centerLeft,
            ),
      ),
      Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
        child: SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: list.map((category) {
              final bool isSelected = category == selectedCatId;
          
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCatId = category;
                    hintText=category;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.links : Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected ? Colors.blue : Colors.black,
                    ),
                  ),
                  child: Text(
                    category,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold,color: isSelected ? Colors.white : Colors.black),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    ],
  );
}


 void _scrollToIndex(int index) {
    final double offset = index * 80.0; // Adjust based on item width and padding
    _scrollController.animateTo(
      offset,
      duration:const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
    );
  }


  Widget _widget(BuildContext context, Size size) {
    return Column(
      children: [

         
                  SizedBox(
                    height: size.height * .01,
                  ),
          
          _searchWidget(context, size),

  
       _categoryFilter(context, size),
        

        _product(context, size)
      ],
    );
  }

  Widget _product(BuildContext context, var size) {
  // Get filtered and searched items
  var list = BlocProvider.of<GetitemsBloc>(context).getMultiFilteredList(
    selectedFilters: selectedFilters,
    selectedCategoryId: selectedCatId,
  );
    
  var finalList = list.where((item) =>
    item.itemTitle!.toLowerCase().contains(searchText.toLowerCase())
  ).toList();



  if (finalList.isEmpty) {
    return Center(
      child: HeadingsWidet(
        h2: "Try Finding Something Else",
        h1: "No items Found",
        alignment: Alignment.center,
      ),
    );
  }

  return Expanded(
    child: SingleChildScrollView(
      child: Padding(
        padding:const EdgeInsets.only(bottom: 4),
        child: Column(
          children: [
            SizedBox(height: size.height * .02),
            Padding(
              padding:const EdgeInsets.only(left: 10),
              child: HeadingsWidet(
                h1: "Products in $hintText",
                alignment: Alignment.centerLeft,
              ),
            ),
            // Use a loop to create rows
          for (int i = 0; i < finalList.length; i += 2)
        SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: ProductOverViewWidget(
                  size: size,
                  blocStates: null,
                  itemEntity: finalList[i],
                ),
              ),
              SizedBox(width: size.width * .01),
              // Check if there's a second item in this row
              if (i + 1 < finalList.length)
                Expanded(
                  child: ProductOverViewWidget(
                    size: size,
                    blocStates: null,
                    itemEntity: finalList[i + 1],
                  ),
                )
              else
               const Spacer(), // Add spacer to keep the layout balanced if only one item
            ],
          ),
        )
          ],
        ),
      ),
    ),
  );
}

}
