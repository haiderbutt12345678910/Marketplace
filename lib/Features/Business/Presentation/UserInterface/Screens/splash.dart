import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ConstStrings/AssetsStrings/assetsurl.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Presentation/StateMangemnet/Bloc/gettokken_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/Bids/getbuyingbids_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/getitems_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/Screens/introscreen.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/landingscreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key,});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _imageInPosition = false;
  double _textOpacity = 0.0;
  String tokken=''; // Start opacity for the text

  @override
  void initState() {
    super.initState();
       BlocProvider.of<GetitemsBloc>(context).getItems(1);
          BlocProvider.of<GetbuyingbidsBloc>(context).getBuyingBids();




   BlocProvider.of<GettokkenBloc>(context).getTokken();

   tokken=   BlocProvider.of<GettokkenBloc>(context).getTokkenLocal();

    // Start sliding the image from the left
    Timer(const Duration(milliseconds: 100), () {
      setState(() {
        _imageInPosition = true;  // Move the image to the center
      });
    });

    // Fade in the text after the image animation completes
    Timer(const Duration(milliseconds: 900), () { // Slightly after image animation completes
      setState(() {
        _textOpacity = 1.0; // Fade in the text
      });
    });


     BlocProvider.of<GetitemsBloc>(context).getItems(1);
          BlocProvider.of<GetitemsBloc>(context).getItems(2);
               BlocProvider.of<GetitemsBloc>(context).getItems(3);
                    BlocProvider.of<GetitemsBloc>(context).getItems(4).then((value){


   Timer(const Duration(seconds: 2), () { // Slightly after image animation completes
    



                     if(tokken==''){
      Navigator.pushReplacement
      (
        context,
        MaterialPageRoute(
          builder: (context) =>  const Introscreen(),
        ),
      );
      }
      else{
   Navigator.pushReplacement
      (
        context,
        MaterialPageRoute(
          builder: (context) =>  const LandingScreen(),
        ),
      );
      


      }


    });






                    },);



    Timer(const Duration(seconds: 4), () {

     
     
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(color: Colors.white),
          ),
          // Animated Align for the logo (centered with a fixed size)
          AnimatedAlign(
            duration: const Duration(milliseconds: 800), // Fast image animation
            alignment: _imageInPosition ? Alignment.center : Alignment.centerLeft,
            child: Container(
              margin:EdgeInsets.all(size.height*.05) ,  // Fixed width
               // Fixed height
              child: Image.asset(AppAssetsUrl.brandLogo),
            ),
          ),
          // Text remains positioned correctly and fades in after the image
          Positioned(
            bottom: 20,
            left: size.width * 0.25,
            right: size.width * 0.25,
            child: AnimatedOpacity(
              opacity: _textOpacity,
              duration: const Duration(milliseconds: 800), // Smooth text fade in
              child: Text(
                'Powered by Softwebies',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold,fontSize: size.height*.016),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
