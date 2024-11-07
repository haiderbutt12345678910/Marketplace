import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/appelevatedbuttons.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/apptextformfeild.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ScreenSizeUtils/screensize.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Presentation/UserInterface/CoreWidegts/authappbar.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Presentation/UserInterface/CoreWidegts/authheader.dart';


class OtoVerificationScreen extends StatefulWidget {
  const OtoVerificationScreen({super.key});

  @override
  State<OtoVerificationScreen> createState() => _OtoVerificationScreenState();
}

class _OtoVerificationScreenState extends State<OtoVerificationScreen> {
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
        body: Form(key: key, child: _otpVer(context, size)));
  }







  Widget _otpVer(BuildContext context, Size size) {
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
            
            
           AuthHeaderWidget(h1: "Verify Otp!", h2: "Otp has been send to your email", tag: "reg",size: size,),
           

        

            Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                   horizontal: size.height * .04,
      vertical: size.height * .005),
                child: TextFormFeildWidget(
                    textEditingController: _textEditingControllerPassowrdReset,
                    idForFeild: "otp")),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                  horizontal: size.height * .01, vertical: size.height * .02),
              child: ElevatedButtonWidget(
                  buttonSize: null,
                  function: () {},
                  buttonText: "Verify"),
            ),
            
             TextButton(
            onPressed: () {
             //send otp via whatapp
            },
            child: const Text(
               
              "Resend Otp Via WhatsApp")),

                TextButton(
            onPressed: () {
             //send otp via whatapp
            },
            child: const Text(
               
              "Send Via Email"))

          ],
        ),
      ),
    );
  }

  validator() {
    key.currentState!.validate();
  }
}
