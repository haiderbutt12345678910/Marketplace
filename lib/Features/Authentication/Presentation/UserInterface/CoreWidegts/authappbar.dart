import 'package:flutter/material.dart';

class AuthAppBarWidegt extends StatelessWidget {
  final  bool hasBackButton;
  final String? title;
  const AuthAppBarWidegt({super.key,
   this.title,
  this.hasBackButton=true});

  @override
  Widget build(BuildContext context) {
    return  AppBar(
       
      centerTitle: true,
      title:title==null?null: Text(title as String,style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.grey),),
      automaticallyImplyLeading: hasBackButton? true :false,
      elevation: 0,
      backgroundColor:title==null? Colors.white: Colors.grey.withOpacity(.1),
      
    );
  }
}