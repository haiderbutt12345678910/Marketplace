import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Branding/appcolors.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ConstStrings/ApisStrings/apiurls.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ConstStrings/AssetsStrings/assetsurl.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/pageheadings.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/getuser_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthHeaderWidget extends StatefulWidget {
  final String h1;
  final String h2;
  final String tag;
  final Size size;
  final bool? isUpdatePassword;
   const AuthHeaderWidget({super.key, required this.h1,required this.h2,required this.tag,required this.size,this.isUpdatePassword});

  @override
  State<AuthHeaderWidget> createState() => _AuthHeaderWidgetState();
}

class _AuthHeaderWidgetState extends State<AuthHeaderWidget> {
  late final user;
  @override
  void initState() {
  user=BlocProvider.of<GetUserBloc>(context).getUserLocal();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        // Hero animation for the image
        Hero(
          tag: widget.tag, // Use a unique tag for the hero animation
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: widget.size.height*.1,vertical: widget.size.height*.05),
            alignment: Alignment.center,
            child:widget.isUpdatePassword==null? Image.asset(
              AppAssetsUrl.brandLogo, // Replace with your image path
               // Set a fixed width for the hero image
               // Set a fixed height for the hero image
              fit: BoxFit.cover,
            ):
            
            Container(
          margin:const EdgeInsets.only(top:1 ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              CircleAvatar(
                  radius: 50, backgroundImage: NetworkImage(
                         '${ApiUrls.baseUrl}/${user.profileImage}'
              
              
                  )),
              SizedBox(
                height: widget.size.height * .03,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          user.name,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: widget.size.height * .01,
                        ),
                        Text(
                          user.mobileNo,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                  
                ],
              ),
              SizedBox(
                height: widget.size.height * .03,
              ),
              SizedBox(
                width: double.infinity,
                child: Divider(
                  color: AppColors.dividerColor,
                ),
              ),
              
            ],
          ),
        )
          ),
        ),
        // Custom heading widget
        Container(
          margin: EdgeInsets.only(left: widget.size.height*.033),
          child: HeadingsWidet(
            h1: widget.h1 ,
            h2: widget.h2,
            alignment: Alignment.bottomLeft,
          ),
        ),
      ],
    );
  }
}

