import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/BlocStates/blocstates.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/appelevatedbuttons.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/apptextformfeild.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/circularprogess.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/snackbarcutom.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ScreenSizeUtils/screensize.dart';
import 'package:flutter_application_ebay_ecom/AppCores/conststrings/AppStrings/authentication_strings.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Domain/Entitites/Register/register_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Presentation/StateMangemnet/Bloc/gettokken_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Presentation/StateMangemnet/Bloc/register_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Presentation/UserInterface/CoreWidegts/accountcheck.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Presentation/UserInterface/CoreWidegts/authappbar.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Presentation/UserInterface/CoreWidegts/authheader.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/cart_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/getsaveditems_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/landingscreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class RegisterScreen extends StatefulWidget {
  final String? navId;
  const RegisterScreen({super.key, this.navId});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _textEditingControllerEmail =
      TextEditingController();
  final TextEditingController _textEditingControllerName =
      TextEditingController();
  final TextEditingController _textEditingControllerPhone =
      TextEditingController();

  final TextEditingController _textEditingControllerPassword =
      TextEditingController();
  final key = GlobalKey<FormState>();

  @override
  void dispose() {
    _textEditingControllerEmail.dispose();
    _textEditingControllerPassword.dispose();
    _textEditingControllerName.dispose();
    _textEditingControllerPhone.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(size.width, size.height*.05),
          child:const AuthAppBarWidegt()),
        body: Form(
            key: key,
            child: BlocConsumer<RegsiterBloc, BlocStates>(builder: (ctx, state) {
              return Stack(
                children: [
                  _logInWidget(context, size),
                  if (state is Loading) const ProgressCircularIndicatorCustom()
                ],
              );
            }, listener: (ctx, state) {
              if (state is Sucessfull) {
                
                      BlocProvider.of<GetsaveditemsBloc>(context).getSavedItems();

               if(widget.navId==null){
             

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LandingScreen()),
                );
                
               }
               else{
                     if(widget.navId=="landing"){
                 BlocProvider.of<GettokkenBloc>(context).getTokken();

                  BlocProvider.of<GetCartBloc>(context).getCat();

                   Navigator.popUntil(context, (route) {
  // Check if the current route is the LandingScreen route
  return route.settings.arguments is LandingScreen || route.isFirst;
});

                }

                      }


                         CustomSnackbar.show(
                iconData: Icons.check_circle_outline,
                
              buildContext: context, errorheading: " Success!", error: "User successfully created", iconColor: Colors.green);
                


              
              } else if (state is Failure) {
             String msg=BlocProvider.of<RegsiterBloc>(context).exception;

              CustomSnackbar.show(
                iconData: Icons.error,
                
              buildContext: context, errorheading: "Failure!", error: msg, iconColor: Colors.red);
                
              } else {





              }
            })));
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

            AuthHeaderWidget(h1: "Let's Get Started!", h2: "Create an Account to get all features ", tag: "reg",size: size,),
           
            _signInWithEmailAndPassword(context, size),

            Expanded(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.all(size.height*.01),
            alignment: Alignment.bottomCenter,
          child: AccountCheckWidegt(isLoginPage: false, size: size),
          
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
      vertical: size.height * .005,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        
       Container(
                width: double.infinity,
                margin: textFormFeildSize,
                child: TextFormFeildWidget(
                  idForFeild: "name",
                  textEditingController: _textEditingControllerName,
                ),
              ),


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
            idForFeild: "phone",
            textEditingController: _textEditingControllerPhone,
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
       
        

        SizedBox(
          height: size.height * .01,
        ),
        ElevatedButtonWidget(
          buttonSize: null,

          function: submit,
       
          buttonText: AuthenticationStrings.btnregisterText,
        ),
        
      ],
    );
  }

  void submit() {
    if(key.currentState!.validate()){
   RegisterEntity registerEntity =RegisterEntity(
              email: _textEditingControllerEmail.text,password: _textEditingControllerPassword.text,confirmPassword: _textEditingControllerPassword.text, name: _textEditingControllerName.text, mobileNo: "92${_textEditingControllerPhone.text}");


        BlocProvider.of<RegsiterBloc>(context).register(registerEntity);
    }

   
  }

  
}
