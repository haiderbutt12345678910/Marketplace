import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/appelevatedbuttons.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/apptextformfeild.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/snackbarcutom.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ScreenSizeUtils/screensize.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Presentation/StateMangemnet/Bloc/updatepassword_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Presentation/UserInterface/CoreWidegts/authheader.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/CoreWidgets/businessappbarwidet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../AppCores/BlocStates/blocstates.dart';
import '../../../../AppCores/CoreWidgets/circularprogess.dart';

class UpdatepassowordScreen extends StatefulWidget {
  const UpdatepassowordScreen({super.key});

  @override
  State<UpdatepassowordScreen> createState() => _UpdatepassowordScreenState();
}

class _UpdatepassowordScreenState extends State<UpdatepassowordScreen> {
  final TextEditingController _textEditingControllerCurrentPassword =
      TextEditingController();
      final TextEditingController _textEditingControllerNewPassword =
      TextEditingController();
  final key = GlobalKey<FormState>();

  @override
  void dispose() {
    _textEditingControllerCurrentPassword.dispose();
    _textEditingControllerNewPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar:  PreferredSize(
          preferredSize: Size(size.width, size.height*.05),
          child:const BusinessAppBarWidget()),
        body: Form(
            key: key,
            child: BlocConsumer<UpdatepasswordBloc, BlocStates>(builder: (ctx, state) {
              return Stack(
                children: [
                 


                  _updatePasswordWidget(context, size),
                  if (state is Loading) const ProgressCircularIndicatorCustom()
                ],
              );
            }, listener: (ctx, state) {
              if (state is Sucessfull) {
               
               
               

                         CustomSnackbar.show(
                iconData: Icons.check_circle_outline,
                
              buildContext: context, errorheading: " Success!", error: "Password updated successfully", iconColor: Colors.green);
                


              
              } else if (state is Failure) {
                String error=BlocProvider.of<UpdatepasswordBloc>(context).getException();

              CustomSnackbar.show(
                iconData: Icons.error,
                
              buildContext: context, errorheading: "Failure!", error: error=='Some thing went wrong  check your credientails or internet connection!'?'':error, iconColor: Colors.red);
                
              } else {





              }
            })));
  }







  Widget _updatePasswordWidget(BuildContext context, Size size) {
    double availableHeight = ScreenSizeUtil.getAvaiableHeight(context,
        removeAppBarSize: true,
        removePaddingBottom: true,
        removePaddingTop: true);

    return SingleChildScrollView(
      child: SizedBox(
        height: availableHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            


            
           AuthHeaderWidget(h1: "Update your password", h2: "Enter your current and new passwords to update", tag: "reg",size: size,
            isUpdatePassword: true,
           ),
           

        

            Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                   horizontal: size.height * .04,
      vertical: size.height * .005),
                child: TextFormFeildWidget(
                    textEditingController: _textEditingControllerCurrentPassword,
                    idForFeild: "cp"
                    
                    
                    )),


                
            Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                   horizontal: size.height * .04,
      vertical: size.height * .005),
                child: TextFormFeildWidget(
                    textEditingController: _textEditingControllerNewPassword,
                    idForFeild: "np")),    
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                  horizontal: size.height * .01, vertical: size.height * .02),
              child: ElevatedButtonWidget(
                  buttonSize: null,
                  function: (){
                            submit(context);

                  },
                  buttonText: "Update"),
            ),
          
        


          ],
        ),
      ),
    );
  }

  
  void submit(BuildContext context){
  if(key.currentState!.validate()){
BlocProvider.of<UpdatepasswordBloc>(context).updatePassowrd(_textEditingControllerCurrentPassword.text,
_textEditingControllerNewPassword.text
);
}




  }
}
