import 'package:flutter_application_ebay_ecom/Features/Authentication/Data/DataSources/remotedatasource.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Data/authrepositoryimpl.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Domain/Usecases/forgotpassword_usecase.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Domain/Usecases/gttokken_usecase.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Domain/Usecases/loginusecase.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Domain/Usecases/register_usecase.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Domain/Usecases/updatepassword_usecase.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Domain/repository.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Presentation/StateMangemnet/Bloc/forgotpassword_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Presentation/StateMangemnet/Bloc/gettokken_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Presentation/StateMangemnet/Bloc/login_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Presentation/StateMangemnet/Bloc/register_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Presentation/StateMangemnet/Bloc/updatepassword_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Data/RemoteDataSource/apidatasource.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Data/repository_impl.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/UseCases/Bids/crearebuyerbids_usecase.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/UseCases/Bids/getbuyingbids_usecase.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/UseCases/cart_usecase.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/UseCases/cities_usecase.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/UseCases/deletemyitem_usecase.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/UseCases/getcategories_usecase.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/UseCases/getitems_usecase.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/UseCases/getmemberships_usecase.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/UseCases/getsingleitem_usecase.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/UseCases/getsinglemembership_usecase.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/UseCases/getsubcategories_usecase.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/UseCases/getuser_usecase.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/UseCases/homeitems_usecase.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/UseCases/myitems_usecase.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/UseCases/recentvieweditem_usecase.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/UseCases/getsaveditems_usecase.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/UseCases/savedeletercentitems_usecase.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/UseCases/savedeletesaveitem_usecase.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/UseCases/sliders_usecase.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/UseCases/updateuser_usecase.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/repository.dart';
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
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
//bloc
//AuthBlocs

  sl.registerFactory<ForgotpasswordBloc>(() => ForgotpasswordBloc(forgotpasswordUsecase: sl.call()));
    sl.registerFactory<UpdatepasswordBloc>(() => UpdatepasswordBloc(updatepasswordUsecase: sl.call()));


  sl.registerFactory<LogInCubit>(() => LogInCubit(logInUseCase: sl.call()));
    sl.registerFactory<GettokkenBloc>(() => GettokkenBloc(getTokkenUseCase: sl.call()));
        sl.registerFactory<RegsiterBloc>(() => RegsiterBloc(authRegisterUseCase: sl.call()));



  //BusinessFeaturesBlocs

  //Bids
    sl.registerFactory<GetbuyingbidsBloc>(() => GetbuyingbidsBloc( getbuyingbidsUsecase: sl.call(),));
    sl.registerFactory<CreatebuyingbidsBloc>(() => CreatebuyingbidsBloc( createbuyingbidsUsecase: sl.call(),));




    //memberships
    sl.registerFactory<GetallmembershipsBloc>(() => GetallmembershipsBloc( getAllMembershipsUseCase: sl.call()));
     sl.registerFactory<GetsinglemembershipsBloc>(() => GetsinglemembershipsBloc( getSingleMemberShipUseCase: sl.call()));




//sliders
    sl.registerFactory<GetSliderBloc>(() => GetSliderBloc(slidersUsecase: sl.call()));


    //cat and sub cat

  sl.registerFactory<GetCategoriesBloc>(
      () => GetCategoriesBloc(getCategoriesUsecase: sl.call()));
  sl.registerFactory<GetSubCategoriesBloc>(
      () => GetSubCategoriesBloc(getSubCategoriesUsecase: sl.call()));




   //get items
  sl.registerFactory<GetitemsBloc>(
      () => GetitemsBloc(getItemsUseCase: sl.call()));
 sl.registerFactory<GetHomeItemsBloc>(
      () => GetHomeItemsBloc(getHomeItemUseCase: sl.call()));

   sl.registerFactory<GetMyItemsBloc>(
      () => GetMyItemsBloc(myItemsUseCase: sl.call())); 
      sl.registerFactory<GetRecentlyViewditemsBloc>(() =>
      GetRecentlyViewditemsBloc(getRecentlyViewedItemsUseCase: sl.call()));

  sl.registerFactory<GetsaveditemsBloc>(
      () => GetsaveditemsBloc(getSavedItemsUseCase: sl.call())); 
        sl.registerFactory<GetsingleitemBloc>(
      () => GetsingleitemBloc(getSingleItemUseCase: sl.call()));




      //save/delete items 
      sl.registerFactory<DeleteMyItemBloc>(
      () => DeleteMyItemBloc(deleteMyItemUseCase: sl.call()));   
       sl.registerFactory<SavedeleterecentitemBloc>(
      () => SavedeleterecentitemBloc(savedeletercentitemsUsecase: sl.call())); 
       sl.registerFactory<SaveItemBloc>(
      () => SaveItemBloc(saveItemUseCase: sl.call()));  
      
  //users
  sl.registerFactory<GetUserBloc>(() => GetUserBloc(getUserUsecase: sl.call()));

  sl.registerFactory<UpdateuserBloc>(
      () => UpdateuserBloc(updateUserUsecase: sl.call()));
      
  //cities
  sl.registerFactory<GetcitiesBloc>(
      () => GetcitiesBloc(getCitiesUseCase: sl.call()));

    
    //cart
      
  sl.registerFactory<GetCartBloc>(() => GetCartBloc(getCartUseCase: sl.call()));




  //Usecases 

  

  //AuthUseCases

  sl.registerLazySingleton<UpdatepasswordUsecase>(
      () => UpdatepasswordUsecase(repository: sl.call()));

   sl.registerLazySingleton<ForgotpasswordUsecase>(
      () => ForgotpasswordUsecase(repository: sl.call()));
  
  
  

  sl.registerLazySingleton<AuthLoginUseCase>(
      () => AuthLoginUseCase(repository: sl.call()));
 sl.registerLazySingleton<GetTokkenUseCase>(
      () => GetTokkenUseCase(repository: sl.call()));
sl.registerLazySingleton<AuthRegisterUseCase>(
      () => AuthRegisterUseCase(repository: sl.call()));




  //BusinessFeaturesUseCases




//Bidsusecases

  sl.registerLazySingleton<GetbuyingbidsUsecase>(
      () => GetbuyingbidsUsecase(repository: sl.call()));
      sl.registerLazySingleton<CreatebuyingbidsUsecase>(
      () => CreatebuyingbidsUsecase(repository: sl.call()));
      
  
      
  

 //membershipsusecases
  sl.registerLazySingleton<GetAllMembershipsUseCase>(
      () => GetAllMembershipsUseCase(repository: sl.call()));

  
sl.registerLazySingleton<GetSingleMemberShipUseCase>(
      () => GetSingleMemberShipUseCase(repository: sl.call()));



  //cat and sub cat usecases

  sl.registerLazySingleton<GetCategoriesUsecase>(
      () => GetCategoriesUsecase(repository: sl.call()));

      
  sl.registerLazySingleton<GetSubCategoriesUsecase>(
      () => GetSubCategoriesUsecase(repository: sl.call()));

  //siliders usecases

  sl.registerLazySingleton<SlidersUsecase>(
      () => SlidersUsecase(repository: sl.call()));

  //get items usecases
 sl.registerLazySingleton<GetHomeItemUseCase>(
      () => GetHomeItemUseCase(repository: sl.call()));

  sl.registerFactory<GetitemsUsecase>(
      () => GetitemsUsecase(repository: sl.call()));
     
    sl.registerFactory<MyItemsUseCase>(
      () => MyItemsUseCase(repository: sl.call()));

      sl.registerFactory<GetSavedItemsUseCase>(
      () => GetSavedItemsUseCase(repository: sl.call()));
  sl.registerFactory<GetRecentlyViewedItemsUseCase>(
      () => GetRecentlyViewedItemsUseCase(repository: sl.call()));
        sl.registerFactory<GetSingleItemUseCase>(
      () => GetSingleItemUseCase(repository: sl.call()));



//save/delete items usecases
   sl.registerFactory<DeleteMyItemUseCase>(
      () => DeleteMyItemUseCase(repository: sl.call()));
 sl.registerFactory<SavedeletercentitemsUsecase>(
      () => SavedeletercentitemsUsecase(repository: sl.call()));
      sl.registerLazySingleton<SaveItemUseCase>(
      () => SaveItemUseCase(repository: sl.call()));


   //users usecases
  sl.registerFactory<GetUserUsecase>(
      () => GetUserUsecase(repository: sl.call()));
  sl.registerFactory<UpdateUserUsecase>(
      () => UpdateUserUsecase(repository: sl.call()));
  

  //citites usecases
  sl.registerFactory<GetCitiesUseCase>(
      () => GetCitiesUseCase(repository: sl.call()));




  
 

 //cart usecases
  sl.registerFactory<GetCartUseCase>(
      () => GetCartUseCase(repository: sl.call()));


//repository
  //authrepo
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authDataSource: sl.call()));

//business
  sl.registerLazySingleton<Repository>(
      () => RepositoryImpl(apidatasource: sl.call()));

//datasource

  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(httpClient: sl.call(), prefs: sl.call()),
  );

  //Business

  sl.registerLazySingleton<Apidatasource>(
    () => ApiDataSourceImpl(httpClient: sl.call(), prefs: sl.call()),
  );

  //externel
  final http.Client httpClient = http.Client();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  sl.registerLazySingleton(() => httpClient);
  sl.registerLazySingleton(() => sharedPreferences);
}
