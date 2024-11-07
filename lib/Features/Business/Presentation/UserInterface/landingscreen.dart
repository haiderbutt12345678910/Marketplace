import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Presentation/StateMangemnet/Bloc/gettokken_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Presentation/UserInterface/loginscreen.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/getsaveditems_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/CoreWidgets/businessappbarwidet.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/CoreWidgets/drawer.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/Screens/homescreen.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/Screens/MyEbay/myebayoverview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  LandingScreenState createState() => LandingScreenState();
}

class LandingScreenState extends State<LandingScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
        MyEbayOverView(),    
        AccountTab()
   ];
   String tokken='';

 void _onItemTapped(int index) {
   BlocProvider.of<GettokkenBloc>(context).getTokken();
   tokken=BlocProvider.of<GettokkenBloc>(context).getTokkenLocal();

  if (tokken=='' && index != 0) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LogInScreen(),
      ),
    );
    return;
  }

  setState(() {
    _selectedIndex = index;
  });
}


  @override
  void initState() {
      if( BlocProvider.of<GettokkenBloc>(context).getTokkenLocal()!=''){
           BlocProvider.of<GetsaveditemsBloc>(context).getSavedItems();

      }




    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      drawer: const CustomDrawer(),
     appBar: PreferredSize(
          preferredSize: Size(double.infinity, size.height*.1),
          child:const BusinessAppBarWidget(),
        ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //to see chnges use tyoe as fixed
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.square_list),
            label: 'Activity',
          ),
         

           BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_circle),
            label: 'Account',
          ),


       



        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
