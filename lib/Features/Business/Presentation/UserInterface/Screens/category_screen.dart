import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/BlocStates/blocstates.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ConstStrings/ApisStrings/apiurls.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/circularprogess.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/pageheadings.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ScreenSizeUtils/screensize.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/getcategories_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/CoreWidgets/businessappbarwidet.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/Screens/products_overview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    super.initState();
    final bloc = BlocProvider.of<GetCategoriesBloc>(context, listen: false);
    bloc.getCat();
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
      body: BlocBuilder<GetCategoriesBloc, BlocStates>(
        builder: (ctx, state) {
          if (state is Loading) {
            return const ProgressCircularIndicatorCustom();
          } else if (state is Sucessfull) {
            return _categoriesWidget(ctx, size);
          } else {
            return InkWell(
              onTap: () {
                BlocProvider.of<GetCategoriesBloc>(context).getCat();
              },
              child: SizedBox(
                height: size.height,
                width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HeadingsWidet(
                      h1: "Error Occured",
                      alignment: Alignment.center,
                      h2: "Failed To Load Data Tap To Retry!",
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  



   Widget _categoriesWidget(BuildContext context, Size size) {
  return BlocBuilder<GetCategoriesBloc, BlocStates>(
    builder: (ctx, state) {
      if (state is Loading) {
        // Show shimmer loading effect when the state is loading
        return SizedBox(
          height: size.height , // Adjust height to prevent overflow
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Max 2 items per row
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 2.5, // Adjust ratio to fit the height
            ),
            itemCount: 10, // Placeholder for loading
            itemBuilder: (ctx, index) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: Colors.grey.withOpacity(.2),
                      width: 1.0,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      } else if (state is Sucessfull) {
        // Get categories from local list
        var categories = BlocProvider.of<GetCategoriesBloc>(context).getLocalList();

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: size.height*.01),
          child: SizedBox(
            height: size.height, // Adjust height
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 items per row
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 2.5, // Adjust ratio to fit the height
              ),
              itemCount: categories.length,
              itemBuilder: (ctx, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: Colors.grey.withOpacity(.2),
                      width: 1.0,
                    ),
                  ),
                  child: ListTile(
                    onTap: (){

                 Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>  ProductsOverview(
          scrollIndex:index ,
         catId: categories[index].categoryName,


        ),
      ),
    );
                    },
                    title: Text(
                      categories[index].categoryName as String, // Use category name
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "20 Products", // Placeholder product count
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    leading: Image.network(
                      '${ApiUrls.baseUrl}/${categories[index].thumbnail}',
                      width: size.height * .07,
                      height: size.height * .07,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset('assets/alternative_image.png'); // Fallback image
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        );
      } else {
        return Container(); // Handle failure state
      }
    },
  );
}


}
