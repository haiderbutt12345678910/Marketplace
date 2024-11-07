import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Branding/Themes/appbar_themes.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Branding/Themes/bottomnavbar_themes.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Branding/Themes/inputdecoration_themes.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Branding/Themes/text_themes.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Branding/Themes/textbutton_themes.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Branding/appcolors.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ConstStrings/AssetsStrings/assetsurl.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ScreenSizeUtils/screensize.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Presentation/StateMangemnet/Bloc/forgotpassword_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Presentation/StateMangemnet/Bloc/gettokken_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Presentation/StateMangemnet/Bloc/login_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Presentation/StateMangemnet/Bloc/register_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Presentation/StateMangemnet/Bloc/updatepassword_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/Bids/createbuyingbids_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/Bids/getbuyingbids_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/cart_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/deletemyitem_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/getallmemberships_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/getcategories_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/getcities_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/gethomeitems_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/getitems_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/getrecentlyviewed_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/getsaveditems_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/getsingleitem_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/getsinglememberships_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/getsubcategories_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/getuser_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/myitems_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/savedeleterecentitem_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/savedeletesaveitem_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/slider_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/updateuser_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/Screens/splash.dart';
import 'dependencyinjection.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await di.init();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp(
    
  ));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  const MyApp({super.key,});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Size screenSize = ScreenSizeUtil.getScreenSized(context);

    return MultiBlocProvider(
      providers: [

      

        //Auth
      BlocProvider<LogInCubit>(create: (_) => di.sl<LogInCubit>()),
      BlocProvider<GettokkenBloc>(create: (_) => di.sl<GettokkenBloc>()),
      BlocProvider<RegsiterBloc>(create: (_) => di.sl<RegsiterBloc>()),
      BlocProvider<GetSliderBloc>(create: (_) => di.sl<GetSliderBloc>()),
      BlocProvider<ForgotpasswordBloc>(create: (_) => di.sl<ForgotpasswordBloc>()),
      BlocProvider<UpdatepasswordBloc>(create: (_) => di.sl<UpdatepasswordBloc>()),





        //BusinessFeatures


          //bids
          BlocProvider<GetbuyingbidsBloc>(create: (_) => di.sl<GetbuyingbidsBloc>()),
          BlocProvider<CreatebuyingbidsBloc>(create: (_) => di.sl<CreatebuyingbidsBloc>()),

             //memberships
           BlocProvider<GetallmembershipsBloc>(
            create: (_) => di.sl<GetallmembershipsBloc>()),
  BlocProvider<GetsinglemembershipsBloc>(
            create: (_) => di.sl<GetsinglemembershipsBloc>()),

               //cat and subcat
             BlocProvider<GetCategoriesBloc>(
            create: (_) => di.sl<GetCategoriesBloc>()),
     
        
        BlocProvider<GetSubCategoriesBloc>(
            create: (_) => di.sl<GetSubCategoriesBloc>()),

            // get items

        BlocProvider<GetitemsBloc>(create: (_) => di.sl<GetitemsBloc>()),
                BlocProvider<GetMyItemsBloc>(create: (_) => di.sl<GetMyItemsBloc>()),
           BlocProvider<GetHomeItemsBloc>(create: (_) => di.sl<GetHomeItemsBloc>()),
                BlocProvider<GetMyItemsBloc>(create: (_) => di.sl<GetMyItemsBloc>()),  
                BlocProvider<GetRecentlyViewditemsBloc>(
            create: (_) => di.sl<GetRecentlyViewditemsBloc>()),
        BlocProvider<GetsaveditemsBloc>(
            create: (_) => di.sl<GetsaveditemsBloc>()),
            
        BlocProvider<GetsingleitemBloc>(
            create: (_) => di.sl<GetsingleitemBloc>()),   

             

             // save/delteitems
               BlocProvider<DeleteMyItemBloc>(create: (_) => di.sl<DeleteMyItemBloc>()),
                   BlocProvider<SaveItemBloc>(
            create: (_) => di.sl<SaveItemBloc>()),
                     BlocProvider<SavedeleterecentitemBloc>(create: (_) => di.sl<SavedeleterecentitemBloc>()),


         //user blocs
        BlocProvider<GetUserBloc>(create: (_) => di.sl<GetUserBloc>()),

        BlocProvider<UpdateuserBloc>(create: (_) => di.sl<UpdateuserBloc>()),


        //cities
        BlocProvider<GetcitiesBloc>(create: (_) => di.sl<GetcitiesBloc>()),




     
        //cart
        BlocProvider<GetCartBloc>(create: (_) => di.sl<GetCartBloc>()),

      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              useMaterial3: false,
              fontFamily: AppFontsUrl.primaryFonts,
              scaffoldBackgroundColor: Colors.white,
              bottomNavigationBarTheme:
                  AppBottomNavBarThemes.darkBg(context, false),
              textTheme: AppTextThemesData.textTheme(context, screenSize, true),
              inputDecorationTheme:
                  InputDecorationsThemesData.inputDecorationTheme(
                      context, screenSize, true),
              textButtonTheme: AppTextButtonThemeData.textButtonThemedata(
                  context, screenSize),
              appBarTheme:
                  AppappBarThemes.appappBarThemes(context, screenSize, true),
              tabBarTheme: TabBarTheme(
                  overlayColor:
                      WidgetStateProperty.all<Color>(AppColors.bgDarkTheme),
                  labelColor: AppColors
                      .textDarkTheme, // Color of the selected tab label
                  unselectedLabelColor: AppColors
                      .textVaraiantDarkTheme, // Color of the unselected tab labels
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                        color: AppColors.textDarkTheme,
                        width: 2.0), // Customize the indicator
                    insets: const EdgeInsets.symmetric(horizontal: 4),
                  ))),
          title: 'Flutter Demo',
          home: const SplashScreen()),
    );
  }
}


