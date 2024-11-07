import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/appelevatedbuttons.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/apptextformfeild.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/snackbarcutom.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ScreenSizeUtils/screensize.dart';
import 'package:flutter_application_ebay_ecom/AppCores/conststrings/AppStrings/authentication_strings.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Presentation/StateMangemnet/Bloc/forgotpassword_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Presentation/UserInterface/CoreWidegts/accountcheck.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Presentation/UserInterface/CoreWidegts/authappbar.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Presentation/UserInterface/CoreWidegts/authheader.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../AppCores/BlocStates/blocstates.dart';
import '../../../../AppCores/CoreWidgets/circularprogess.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _textEditingControllerPassowrdReset =
      TextEditingController();
  final key = GlobalKey<FormState>();

  @override
  void dispose() {
    _textEditingControllerPassowrdReset.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar:  PreferredSize(
          preferredSize: Size(size.width, size.height*.05),
          child:const AuthAppBarWidegt()),
        body: Form(
            key: key,
            child: BlocConsumer<ForgotpasswordBloc, BlocStates>(builder: (ctx, state) {
              return Stack(
                children: [
                  _forgetPasswordWidget(context, size),
                  if (state is Loading) const ProgressCircularIndicatorCustom()
                ],
              );
            }, listener: (ctx, state) {
              if (state is Sucessfull) {
               
               
               

                         CustomSnackbar.show(
                iconData: Icons.check_circle_outline,
                
              buildContext: context, errorheading: " Success!", error: "A passoword reset link has been sent to yout account", iconColor: Colors.green);
                


              
              } else if (state is Failure) {
                String exception=BlocProvider.of<ForgotpasswordBloc>(context).exception;

              CustomSnackbar.show(
                iconData: Icons.error,
                
              buildContext: context, errorheading: "Failure!", error: exception, iconColor: Colors.red);
                
              } else {





              }
            })));
  }







  Widget _forgetPasswordWidget(BuildContext context, Size size) {
    double availableHeight = ScreenSizeUtil.getAvaiableHeight(context,
        removeAppBarSize: true,
        removePaddingBottom: true,
        removePaddingTop: true);

    return SingleChildScrollView(
      child: SizedBox(
        height: availableHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            
           AuthHeaderWidget(h1: "Forgot password!", h2: "Enter your email to get reset link", tag: "reg",size: size,),
           

        

            Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                   horizontal: size.height * .04,
      vertical: size.height * .005),
                child: TextFormFeildWidget(
                    textEditingController: _textEditingControllerPassowrdReset,
                    idForFeild: "e")),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                  horizontal: size.height * .01, vertical: size.height * .02),
              child: ElevatedButtonWidget(
                  buttonSize: null,
                  function: (){
                            submit(context);

                  },
                  buttonText: AuthenticationStrings.btnResetPassword),
            ),
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

  validator() {
    key.currentState!.validate();
  }

  void submit(BuildContext context){
  if(key.currentState!.validate()){
BlocProvider.of<ForgotpasswordBloc>(context).forgotpassword(_textEditingControllerPassowrdReset.text);
}




  }
}
