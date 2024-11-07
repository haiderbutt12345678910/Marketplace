import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/BlocStates/blocstates.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Branding/appcolors.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ConstStrings/ApisStrings/apiurls.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/circularprogess.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Presentation/StateMangemnet/Bloc/gettokken_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/user_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/getuser_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/Screens/AboutCompany/aboutcompany.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/Screens/AboutCompany/contactus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
var list = [
   
  ['About us', Icons.info,const AboutcompanyScreen(navId: 'au',)], // Info icon for "About Us"
  ['Contact us', Icons.contact_mail, const ContactusScreen()], // Mail icon for "Contact Us"
  ['Terms and conditions', Icons.description,const AboutcompanyScreen(navId: "tc",)], // Document icon for "Terms and Conditions"
  ['Refund policy', Icons.receipt_long,const  AboutcompanyScreen(navId: "rp",)], // Receipt icon for "Refund Policy"
  ['Support chat', Icons.chat,const ContactusScreen()], // Chat icon for "Support Chat"
 // Logout icon for "Sign Out"



  ];

@override
  void initState() {
    super.initState();
    BlocProvider.of<GettokkenBloc>(context).getTokken();
    var getTokken=BlocProvider.of<GettokkenBloc>(context).getTokkenLocal();
    if(getTokken!=""){
    list.add( ['Sign out', Icons.logout, Container()]);


    }
  }
  @override
  Widget build(BuildContext context) {


    
    final size=MediaQuery.of(context).size;
    return Drawer(
      
      
      child: Column(
        children: [
          // Drawer Header
           _profileSection(context, size),

        const  SizedBox(height: 5,),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                for(int i=0;i< list.length;i++)
                _createDrawerItem(
                  
                  
                  icon: list[i][1] as IconData,
                  text: list[i][0] as String,
                  onTap: () {
                    if(i!=list.length-1){

                    

                         Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => list[i][2] as Widget,
  ),
);
                    }




                  }, context:  context
                   ,
                  
                   
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _createDrawerItem({
    required BuildContext context,
    required IconData icon,
    required String text,
    required Function() onTap,
  }) {
    return ListTile(
      leading: Icon(icon,color: Colors.grey,),
      title: Text(text,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),),
      trailing: IconButton(onPressed: onTap, icon: const Icon(Icons.arrow_forward,size: 20,color: Colors.grey,))
    );
  }

     Widget _profileSection(BuildContext context, Size size) {
      if(BlocProvider.of<GetUserBloc>(context).getUserLocal().email==""){
           BlocProvider.of<GetUserBloc>(context).getUser();



      }
    return BlocBuilder<GetUserBloc, BlocStates>(builder: (ctx, state) {



    
      UserEntity user = BlocProvider.of<GetUserBloc>(context).getUserLocal();

      
      if (state is Loading) {
        return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            width: size.width * .4,
            height: size.height * .2,
            child:  ProgressCircularIndicatorCustom(
              barColor: AppColors.links,
              bgColor: Colors.white,
            ));
      } else if (state is Sucessfull) {
        return Container(
          color: AppColors.links,
          padding:const EdgeInsets.only(top: 15,left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * .04,
              ),
              CircleAvatar(
                  radius: 50, backgroundImage: NetworkImage(
                         '${ApiUrls.baseUrl}/${user.profileImage}'
              
              
                  )),
              SizedBox(
                height: size.height * .03,
              ),
              Padding(
                padding:const EdgeInsets.only(left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.name,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: size.height * .01,
                          ),
                          Text(
                            user.mobileNo,
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    
                  ],
                ),
              ),
              SizedBox(
                height: size.height * .01,
              ),
             
             
            ],
          ),
        );
      } else {
        return Container(
          color: AppColors.links,
          padding:const EdgeInsets.only(top: 15,left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * .04,
              ),
              CircleAvatar(
                backgroundColor: Colors.grey,
                  radius: 50, backgroundImage: NetworkImage(
                    
                         '${ApiUrls.baseUrl}/${user.profileImage}'
              
              
                  )),
              SizedBox(
                height: size.height * .03,
              ),
              Padding(
                padding:const EdgeInsets.only(left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "user name here",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: size.height * .01,
                          ),
                          Text(
                            "Mobile number here",
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    
                  ],
                ),
              ),
              SizedBox(
                height: size.height * .01,
              ),
             
             
            ],
          ),
        
        );
      }
    });
  }
}
