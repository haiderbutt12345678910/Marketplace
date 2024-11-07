import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/BlocStates/blocstates.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Branding/appcolors.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ConstStrings/ApisStrings/apiurls.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/pageheadings.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ScreenSizeUtils/screensize.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/getcategories_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/gethomeitems_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/getitems_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/slider_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/CoreWidgets/FeaturesCoreWidgets/topbannerads.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/Screens/category_screen.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/Screens/products_overview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../CoreWidgets/FeaturesCoreWidgets/productoverview_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();


    BlocProvider.of<GetSliderBloc>(context).getSlider();
    BlocProvider.of<GetCategoriesBloc>(context).getCat();

    BlocProvider.of<GetHomeItemsBloc>(context).getHomeItems();
  }

  @override
  Widget build(BuildContext context) {
    final size = ScreenSizeUtil.getScreenSized(context);
    return SizedBox(
          height: size.height,
          child: SingleChildScrollView(
            child: SizedBox(
              child: Column(
                children: [
                  BannerAdsWidget(
                    height: size.height * .3,
                  ),
                 
                  SizedBox(
                    height: size.height * .01,
                  ),

                 _categoriesWidget(context, size),

              SizedBox(height: size.height * .03),

                  _productSection(context, size),
                ],
              ),
            ),
          ));
  }

  Widget _screenHeadings(String heading ,Size size, {bool? isCat} ){
return   Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.height * .02,
                ),
                child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Expanded(
      flex: 2,
      child: HeadingsWidet(
        h1: heading,
        alignment: Alignment.bottomLeft,
      ),
    ),
    TextButton(
      onPressed: () {
        if(isCat!=null){
       Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CategoryScreen(),
      ),
    );

        }

        else{


                 Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProductsOverview(),
      ),
    );
        }
    


      },
      child: Text(
        "See All",
        style: TextStyle(
          decorationColor: AppColors.links,
          decoration: TextDecoration.underline,
        ),
      ),
    ),
  ],
),
              );


  }

  Widget _productSection(BuildContext context, Size size) {
    return BlocBuilder<GetHomeItemsBloc, BlocStates>(builder: (ctx, state) {
      var homeItemEntity = BlocProvider.of<GetHomeItemsBloc>(context).getHomeItemEntityLocal();
      
      if (state is Loading) {
       return SizedBox(
          child: Column(
            children: [
              _shimmerList(size), // Shimmer placeholder for Recently viewed

              SizedBox(height: size.height * .04),
              _shimmerList(size), // Shimmer placeholder for Recommended Items

              SizedBox(height: size.height * .04),

               // Shimmer placeholder for Random Items
            ],
          ),
        );
      } else if (state is Sucessfull) {
        BlocProvider.of<GetHomeItemsBloc>(ctx).getHomeItemEntityLocal();
                BlocProvider.of<GetitemsBloc>(ctx).itemList;

     
        return SizedBox(
         // height: size.height * .632,
          child: Column(
            children: [

                
             
              
              _items(context, size, state, homeItemEntity.recentViewed,"Recently viewed"),
              SizedBox(height: size.height * .04),
               _items(context, size, state, homeItemEntity.recommendedItems,"Recomended Items"),
              SizedBox(height: size.height * .04),

               _items(context, size, state, homeItemEntity.baseOnSearch,"Based on search"),
              SizedBox(height: size.height * .04),

               _items(context, size, state, homeItemEntity.randomItems,"Random Items"),

               
               
             
            ],
          ),
        );
      } else {
        return SizedBox(
          height: size.height*.7,
          width: double.infinity,
          child: InkWell(
            onTap: () {

              BlocProvider.of<GetSliderBloc>(context).getSlider();
    BlocProvider.of<GetCategoriesBloc>(context).getCat();

    BlocProvider.of<GetHomeItemsBloc>(context).getHomeItems();
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
    });
  }

  Widget _shimmerList(Size size) {
  return SizedBox(
    height: size.height * .2, // Adjust height based on design
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 4, // Placeholder count for shimmer
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: size.width * 0.4, // Adjust width as needed
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      },
    ),
  );
}

  Widget _items(
      BuildContext context, Size size, BlocStates state, var list,String heading) {
    return Column(
      children: [

       _screenHeadings(heading, size),

   

         for (int i = 0; i < list.length; i += 2)
  SizedBox(
    width: double.infinity,
    child: Row(
      children: [
        Expanded(
          child: ProductOverViewWidget(
            myItemEntity: list[i],
            size: size,
            blocStates: null,
            itemEntity: null,
          ),
        ),
        SizedBox(width: size.width * .01),
        // Check if there's a second item in this row
        if (i + 1 < list.length)
          Expanded(
            child: ProductOverViewWidget(
              size: size,
              blocStates: null,
              myItemEntity: list[i + 1],
            ),
          )
        else
         const Spacer(), 
      ],
    ),
  )
      ],
    );
  }

  Widget _categoriesWidget(BuildContext context, Size size) {
  return BlocBuilder<GetCategoriesBloc, BlocStates>(
    builder: (ctx, state) {
      if (state is Loading) {
        // Show shimmer loading effect when the state is loading
        return SizedBox(
          height: size.height * .1,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10, // Placeholder for loading
            itemBuilder: (ctx, index) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: size.height * .08,
                  margin: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: Colors.grey.withOpacity(.2),
                      width: 1.0,
                    ),
                  ),
                  width: size.width * 0.5,
                ),
              );
            },
          ),
        );
      } else if (state is Sucessfull) {
        // Show actual data when the state is successful
        var categories =     BlocProvider.of<GetCategoriesBloc>(context).getLocalList();
 // Assuming state.data contains the list of categories
        return SizedBox(
          height: size.height*.163,
          child: Column(
            children: [
              _screenHeadings("Shop by category", size,isCat: true),
          
          
          
              SizedBox(
                height: size.height * .1,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length-3,
                  itemBuilder: (ctx, index) {
                    return Container(
                      height: size.height * .08,
                      margin: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                          color: Colors.grey.withOpacity(.2),
                          width: 1.0,
                        ),
                      ),
                      width: size.width * 0.5,
                      child: ListTile(
                        onTap: (){


                                    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>  ProductsOverview(
          catId:categories[index].categoryName ,
          scrollIndex: index,
        ),
      ),
    );
                        },
                        title: Text(
                          categories[index].categoryName as String, // Use actual category name
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "20 Products", // Assuming category has a product count
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        leading: SizedBox(
                          width: size.height * .07,
                          height: size.height * .07,
                          child: Image.network(
                    '${ApiUrls.baseUrl}/${categories[index].thumbnail}'
              , // Use actual image URL from the category
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child; // Image loaded
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes != null
                                        ? loadingProgress.cumulativeBytesLoaded /
                                            (loadingProgress.expectedTotalBytes ?? 1)
                                        : null,
                                  ),
                                );
                              }
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                'assets/alternative_image.png', // Fallback image if load fails
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      } else {
        // Handle failure state
        return  Container();
      }
    },
  );
}

}
