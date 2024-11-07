import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/BlocStates/blocstates.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Branding/appcolors.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/circularprogess.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ScreenSizeUtils/screensize.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Presentation/StateMangemnet/Bloc/gettokken_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Presentation/UserInterface/loginscreen.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/cart_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/CoreWidgets/FeaturesCoreWidgets/notification_widget.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/Screens/cart_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CartNotificationWidget extends StatefulWidget {
  const CartNotificationWidget({super.key});

  @override
  State<CartNotificationWidget> createState() => _CartNotificationWidgetState();
}
String tokken='';
class _CartNotificationWidgetState extends State<CartNotificationWidget> {
  @override
  void initState() {
    BlocProvider.of<GettokkenBloc>(context).getTokken();


    tokken=  BlocProvider.of<GettokkenBloc>(context).getTokkenLocal();

      
    var list = BlocProvider.of<GetCartBloc>(context).getLocalList();
    if(tokken==''){

    }
    else{
      if(BlocProvider.of<GetCartBloc>(context).alreadyCalled==false){
      if (list.isEmpty) {
      
      BlocProvider.of<GetCartBloc>(context).getCat();
    }


      }
    
    }
   

    super.initState();
  }
    double iconsize=25;

  @override
  Widget build(BuildContext context) {
    final Size size = ScreenSizeUtil.getScreenSized(context);
    return _widgetBloc(size);
  }

  Widget _widgetBloc(Size size ){


  return  BlocBuilder<GetCartBloc, BlocStates>(builder: (ctx, state) {
      var list = BlocProvider.of<GetCartBloc>(context).getLocalList();
      String count = list.length.toString();

      if (state is Loading) {
        return Container(
          margin: const EdgeInsets.all(3),
          height: 40,
          width: 40,
          child:  ProgressCircularIndicatorCustom(
              bgColor: Colors.white, barColor: AppColors.links),
        );
      }
      if (state is Sucessfull) {
        return Row(
          children: [
           _notificationWidgets(context, size, count, 'massege'),
           _notificationWidgets(context, size, count, 'cart'),

           IconButton(onPressed: (){


           }, icon: Icon(Icons.search,size: iconsize,color: Colors.grey,),
           
           )
 





          ],
        );
      } else {
        return temp(size);
      }
    });
  }

 Widget temp(Size size,){

   return Row(
          children: [
           _notificationWidgets(context, size, "0", 'massege'),
           _notificationWidgets(context, size, "0", 'cart'),

           IconButton(onPressed: (){


           }, icon: Icon(Icons.search,size: iconsize,color: Colors.grey,),
           
           )
 





          ],
        );
 }

  Widget _notificationWidgets(BuildContext context,Size size,String count,String id){


         return  
            InkWell(
              onTap: () {
                         BlocProvider.of<GettokkenBloc>(context).getTokken();
                   tokken=   BlocProvider.of<GettokkenBloc>(context).getTokkenLocal();

                
                if(id=='cart'){
                  if(tokken==''){

                      Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LogInScreen(navId: 'landing',)),
                );  

                }else{
                 

                                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartScreen()),
                );

                }
              
                  }
           
              },
              child: Container(
                margin: const EdgeInsets.only(top: 5, right:1),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.height * .012,
                          vertical: size.height * .015),
                      decoration: BoxDecoration(
                          color: AppColors.bgDarkTheme, shape: BoxShape.circle),
                      child:  Icon(
                       id=="cart"? CupertinoIcons.cart_fill: Icons.notifications,

                        size: iconsize,
                        color: Colors.grey,
                      ),
                    ),

                    if(BlocProvider.of<GettokkenBloc>(context).getTokkenLocal()!='')
                    Positioned(
                      right: 8,
                      top: 4,
                      child: NotificationBadgeWidget(
                        notificationId: id,
                        count: count,
                      ),
                    ),
                  ],
                ),
              ),
            );
   


  }
}
