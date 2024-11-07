import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/appelevatedbuttons.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/apptextformfeild.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/snackbarcutom.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Presentation/UserInterface/CoreWidegts/authappbar.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Presentation/UserInterface/CoreWidegts/authheader.dart';


class ContactusScreen extends StatefulWidget {
  final String? navId;
  const ContactusScreen({super.key, this.navId});

  @override
  State<ContactusScreen> createState() => _ContactusScreenState();
}

class _ContactusScreenState extends State<ContactusScreen> {
  final TextEditingController _textEditingControllerEmail =
      TextEditingController();
  final TextEditingController _textEditingControllerName =
      TextEditingController();
  final TextEditingController _textEditingControllerPhone =
      TextEditingController();

  final TextEditingController _textEditingControllermassege =
      TextEditingController();
  final key = GlobalKey<FormState>();

  @override
  void dispose() {
    _textEditingControllerEmail.dispose();
    _textEditingControllermassege.dispose();
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
        resizeToAvoidBottomInset: true,
         appBar: PreferredSize(
          preferredSize: Size(size.width, size.height*.05),
          child:const AuthAppBarWidegt(
            title: "Contact Us",
          )),
        body: Form(
            key: key,
            child:                   _logInWidget(context, size),
));
  }





  Widget _logInWidget(BuildContext context, Size size) {
   
    return SingleChildScrollView(
  
      child: SizedBox(
        height: size.height,
        child: Column(
          children: [
            SizedBox(
              height: size.height * .003,
            ),

            AuthHeaderWidget(h1: "Contact Us!", h2: "Drop a massege for customer support ", tag: "reg",size: size,),
           
            _signInWithEmailAndPassword(context, size),

            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                    'Powered by Softwebies',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Colors.black, fontWeight: FontWeight.bold,fontSize: size.height*.016),
                    textAlign: TextAlign.center,
                  ),
              ),
            )

         
          ],
        ),
      ),
    );
  }

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
                  isContactUs: true,
                  idForFeild: "name",
                  textEditingController: _textEditingControllerName,
                ),
              ),


        Container(
          width: double.infinity,
          margin: textFormFeildSize,
          child: TextFormFeildWidget(
            isContactUs: true,
            idForFeild: "e",
            textEditingController: _textEditingControllerEmail,
          ),
        ),

        Container(
          width: double.infinity,
          margin: textFormFeildSize,
          child: TextFormFeildWidget(
            isContactUs: true,
            idForFeild: "phone",
            textEditingController: _textEditingControllerPhone,
          ),
        ),
       Container(
  height: size.height * .2, // Apply height here
  width: double.infinity,
  margin: textFormFeildSize,
  child: SizedBox(
    height: double.infinity, // Make the SizedBox fill the parent Container
    child: TextFormFeildWidget(
      isContactUs: true,
      idForFeild: "msg",
      textEditingController: _textEditingControllermassege,
    ),
  ),
),
        

       
        ElevatedButtonWidget(
          buttonSize: null,

          function: (){
            submit(context);
          },
       
          buttonText: "Sumbit",
        ),
        
      ],
    );
  }

  void submit(BuildContext contexts) {
    if(key.currentState!.validate()){
     CustomSnackbar.show(buildContext: contexts, errorheading: "Success", error: "You will be contacted shorlty by our team", iconColor: Colors.green, iconData: Icons.abc);
    }

   
  }

  
}
