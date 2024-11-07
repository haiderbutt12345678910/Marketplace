import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/appelevatedbuttons.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/apptextformfeild.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/snackbarcutom.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ScreenSizeUtils/screensize.dart';
import 'package:flutter_application_ebay_ecom/AppCores/conststrings/AppStrings/authentication_strings.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Presentation/StateMangemnet/Bloc/gettokken_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Presentation/StateMangemnet/Bloc/login_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Presentation/UserInterface/CoreWidegts/accountcheck.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Presentation/UserInterface/CoreWidegts/authappbar.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Presentation/UserInterface/CoreWidegts/authheader.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Presentation/UserInterface/forgetpasswordscreen.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/cart_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/getcities_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/getsaveditems_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/landingscreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../AppCores/BlocStates/blocstates.dart';
import '../../../../AppCores/CoreWidgets/circularprogess.dart';

class LogInScreen extends StatefulWidget {
 final String? navId;
  const LogInScreen({super.key, this.navId});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController _textEditingControllerEmail =
      TextEditingController();

  final TextEditingController _textEditingControllerPassword =
      TextEditingController();

  final key = GlobalKey<FormState>();
  @override
  void initState() {
    BlocProvider.of<GetcitiesBloc>(context).getCities();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingControllerEmail.dispose();
    _textEditingControllerPassword.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(size.width, size.height*.05),
          child:const AuthAppBarWidegt(hasBackButton: false,)),
        body: Form(
            key: key,
            child: BlocConsumer<LogInCubit, BlocStates>(builder: (ctx, state) {
              return Stack(
                children: [
                  _logInWidget(context, size),
                  if (state is Loading) const ProgressCircularIndicatorCustom()
                ],
              );
            }, listener: (ctx, state) {



              if (state is Sucessfull) {
      // Call your necessary Bloc actions
      BlocProvider.of<GetsaveditemsBloc>(context).getSavedItems();
      
      if (widget.navId == null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LandingScreen()),
        );
      } else if (widget.navId == "landing") {
        BlocProvider.of<GettokkenBloc>(context).getTokken();
        BlocProvider.of<GetCartBloc>(context).getCat();

        Navigator.popUntil(context, (route) {
          return route.settings.arguments is LandingScreen || route.isFirst;
        });
      }

      // Show success snackbar
      CustomSnackbar.show(
        iconData: Icons.check_circle_outline,
        buildContext: context,
        errorheading: "Success!",
        error: "Successfully logged in",
        iconColor: Colors.green,
      );

      
    } else if (state is Failure) {

      // Show failure snackbar
      CustomSnackbar.show(
        iconData: Icons.error,
        buildContext: context,
        errorheading: "Failure!",
        error: "Failed to log in check your credentails or internet connection",
        iconColor: Colors.red,
      );
    }
            }
            
            
            
            
            )));
  }

   Widget _logInWidget(BuildContext context, Size size) {
    double availableHeight = ScreenSizeUtil.getAvaiableHeight(context,
        removeAppBarSize: true,
        removePaddingBottom: true,
        removePaddingTop: true);
    return SingleChildScrollView(
      child: SizedBox(
        height: availableHeight,
        child: Column(
          children: [
            SizedBox(
              height: size.height * .003,
            ),

            AuthHeaderWidget(h1: "Welcome Back!", h2: "Sign in to continue", tag: "reg",size: size,),
           
            _signInWithEmailAndPassword(context, size),

            Expanded(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.all(size.height*.01),
            alignment: Alignment.bottomCenter,
          child: AccountCheckWidegt(isLoginPage: true, size: size),
          
          ),
        )
          ],
        ),
      ),
    );
  }
  //For SignInWithEmailAndPassword
  Widget _signInWithEmailAndPassword(BuildContext context, Size size) {
    EdgeInsets textFormFeildSize = EdgeInsets.symmetric(
      horizontal: size.height * .04,
      vertical: size.height * .004,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          margin: textFormFeildSize,
          child: TextFormFeildWidget(
            idForFeild: "e",
            textEditingController: _textEditingControllerEmail,
          ),
        ),
        Container(
          width: double.infinity,
          margin: textFormFeildSize,
          child: TextFormFeildWidget(
            idForFeild: "p",
            textEditingController: _textEditingControllerPassword,
          ),
        ),
        
        Container(
          margin: EdgeInsets.only(right: size.height * .03),
          alignment: Alignment.topRight,
          width: double.infinity,
          child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ForgetPasswordScreen()),
                );
              },
              child: Text(AuthenticationStrings.btnForgotPassword)),
        ),
        ElevatedButtonWidget(
          
          buttonSize: null,
          function: submit,
          buttonText: AuthenticationStrings.btnlogInText,
        ),
      ],
    );
  }

  

  void submit() {
    if(key.currentState!.validate()){
    BlocProvider.of<LogInCubit>(context).logIn(
        _textEditingControllerEmail.text, _textEditingControllerPassword.text);
    }

   
  }

  
}
