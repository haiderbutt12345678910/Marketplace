import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/BlocStates/blocstates.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Branding/appcolors.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/circularprogess.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ConstStrings/ApisStrings/apiurls.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ScreenSizeUtils/screensize.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Presentation/UserInterface/updatepassoword_screen.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/user_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/getuser_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/Screens/MyEbay/Buying/mybids_screen.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/Screens/MyEbay/Buying/recentlyviewed_screen.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/Screens/MyEbay/Buying/saved_screen.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/Screens/MyEbay/Selling/myitems_screen.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/Screens/MyEbay/Selling/soldusolditems_screen.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/Screens/identityverification.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/Screens/masseges.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/Screens/mebership_screen.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/Screens/profile_screen.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/Screens/sellingoverview.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/Screens/settingsscreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyEbayOverView extends StatelessWidget {
  MyEbayOverView({super.key});

  final list = [
    [
      Icons.favorite_outlined,
      'Saved',
    ],
    [
      Icons.pan_tool_sharp,
      'Bids and offers',
    ],
  ];
  @override
  Widget build(BuildContext context) {
    final size = ScreenSizeUtil.getScreenSized(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: null,
          // Customize your app bar title
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(3.0),
            child: TabBar(
              unselectedLabelStyle:Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.normal) ,
              labelStyle: Theme.of(context).textTheme.titleLarge,
               labelColor: AppColors.links,
                unselectedLabelColor: Colors.grey,
indicator: UnderlineTabIndicator(
    borderSide: BorderSide(
      color: AppColors.links, // Custom underline color
      width: 3.0, // Thickness of the underline
    ),
  ),              tabs: const [
                Tab(text: "Selling "),
                Tab(text: "Buying "),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: size.height * .05),
                child: Column(
                  children: [SellingTab()],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: size.height * .05),
                child: Column(
                  children: [ByersTab()],
                ),
              ),
            ),
          
          ],
        ),
      ),
    );
  }


 


  Widget memberships(BuildContext context, Size size) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SettingsScreen(),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: SizedBox(
                    height: size.height * .04,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      alignment: Alignment.topLeft,
                      child: Icon(
                        Icons.settings,
                        color: AppColors.iconsDarkTheme,
                      ),
                    )),
                    Expanded(
                        flex: 4,
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Memberships",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * .02,
          )
        ],
      ),
    );
  }

}

class SellingTab extends StatelessWidget {
  SellingTab({super.key});
  final sellingList = [
     ['Sell Item', CupertinoIcons.tag,  SellingOverView()],


    ['MY ITEMS', Icons.list_alt, const MyitemsScreen()],
    ['SOLD ITEMS', Icons.check_box,const SoldUnSoldItemsScreen(id: "s",)],
    ['UNSOLD ITEMS', Icons.remove_shopping_cart,const SoldUnSoldItemsScreen(id: "us",)],
    //['ITEM BIDS', Icons.local_offer,const MyitemsScreen()],
    
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
    
        for (int i = 0; i < sellingList.length; i++)
              ListTile(
      leading: Icon(sellingList[i][1] as IconData,color: Colors.grey,),
      title: Text(sellingList[i][0] as String,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),),
      trailing: IconButton(onPressed: (){
              Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => sellingList[i][2] as Widget,
  ),
);


      }, icon: const Icon(Icons.arrow_forward,size: 20,color: Colors.grey,))
    ),
        SizedBox(
          height: size.height * .03,
        ),
        SizedBox(
          width: double.infinity,
          child: Divider(
            color: AppColors.dividerColor,
          ),
        ),
      ],
    );
  }
}

class ByersTab extends StatelessWidget {
  ByersTab({super.key});
  final buyersList = [
    ['MY BIDS', Icons.gavel,const BuyingBidsScreen()],
    ['RECENTLY VIEWED', Icons.visibility,const RecentlyViewedScreen()],
    ['SAVED', Icons.bookmark,const SavedItemsScreen()],
    //['PURCHASE HISTORY', Icons.history,const RecentlyViewedScreen()],
   // ['MY RETURNS', Icons.assignment_return, const RecentlyViewedScreen()],
   // ['RATINGS AND REVIEWS', Icons.rate_review,const RecentlyViewedScreen()],
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    
    
        for (int i = 0; i < buyersList.length; i++)
             ListTile(
      leading: Icon(buyersList[i][1] as IconData,color: Colors.grey,),
      title: Text(buyersList[i][0] as String,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),),
      trailing: IconButton(onPressed: (){

            Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => buyersList[i][2] as Widget,
  ),
);


      }, icon: const Icon(Icons.arrow_forward,size: 20,color: Colors.grey,))
    ),
        SizedBox(
          height: size.height * .03,
        ),
        SizedBox(
          width: double.infinity,
          child: Divider(
            color: AppColors.dividerColor,
          ),
        ),
      ],
    );
  }
}


  
class AccountTab extends StatelessWidget {
  AccountTab({super.key});
  final accountList = [
    ['MESSAGES', Icons.message,MassegedOverView()],
    ['PROFILE', Icons.person,const ProfileScreen()],
    ['IDENTITY VERIFICATION', Icons.verified_user,const IdentityVerificationScreen()],
    ['SETTING', Icons.settings, const SettingsScreen()],
    ['MEMBERSHIPS', Icons.card_membership, const MembeShopOverViewScreen()],
    ['CHANGE PASSWORD', Icons.lock,const UpdatepassowordScreen()],
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(

      child: Container(
      margin: EdgeInsets.symmetric(horizontal: size.height * .05),


        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             _profileSection(context, size),

            for (int i = 0; i < accountList.length; i++)
             ListTile(
      leading: Icon(accountList[i][1] as IconData,color: Colors.grey,),
      title: Text(accountList[i][0] as String,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),),
      trailing: IconButton(onPressed: (){

         Navigator.push(
context,
MaterialPageRoute(
  builder: (context) => accountList[i][2] as Widget,
),
);
           
   

      }, icon: const Icon(Icons.arrow_forward,size: 20,color: Colors.grey,))
    ),
            SizedBox(
              height: size.height * .03,
            ),
            SizedBox(
              width: double.infinity,
              child: Divider(
                color: AppColors.dividerColor,
              ),
            ),
          ],
        ),
      ),
    );
  }



    Widget _profileSection(BuildContext context, Size size) {
             BlocProvider.of<GetUserBloc>(context).getUser();

     
    return BlocBuilder<GetUserBloc, BlocStates>(builder: (ctx, state) {



    
      UserEntity user = BlocProvider.of<GetUserBloc>(context).getUserLocal();

      
      if (state is Loading) {
        return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            width: size.width * .4,
            height: size.height * .2,
            child: const ProgressCircularIndicatorCustom(
              bgColor: Colors.white,
            ));
      } else if (state is Sucessfull) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * .04,
            ),
            CircleAvatar(
                radius: 50, backgroundImage: NetworkImage(
           '${ApiUrls.baseUrl}/${user.profileImage}'


                )),
            SizedBox(
              height: size.height * .03,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        user.name,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: size.height * .01,
                      ),
                      Text(
                        user.mobileNo,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: () {
                      //Naviget to profile
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileScreen(),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.edit_document,
                      color: AppColors.links,
                    ),
                  ),
                ))
              ],
            ),
            SizedBox(
              height: size.height * .03,
            ),
            SizedBox(
              width: double.infinity,
              child: Divider(
                color: AppColors.dividerColor,
              ),
            ),
            SizedBox(
              height: size.height * .04,
            )
          ],
        );
      } else {
        return Container();
      }
    });
  }

}
