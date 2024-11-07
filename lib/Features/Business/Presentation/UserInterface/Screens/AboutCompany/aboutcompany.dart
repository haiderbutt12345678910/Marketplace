import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Branding/appcolors.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ConstStrings/AssetsStrings/assetsurl.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/pageheadings.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ScreenSizeUtils/screensize.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Presentation/UserInterface/CoreWidegts/authappbar.dart';

class AboutcompanyScreen extends StatefulWidget {
 final String navId;

 const AboutcompanyScreen({super.key,required this.navId});

  @override
  State<AboutcompanyScreen> createState() => _AboutcompanyScreenState();
}

class _AboutcompanyScreenState extends State<AboutcompanyScreen> {
  


  final listTc=["Terms & conditions","Cancellation policy"];
  final listRp=["Refund policy","Request for refund"];

  String title='';
  
var dataList = [
  [
    "Introduction",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
  ],
  [
    "Features",
    " Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n\n"
    " Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\n"
    " Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\n"
    " Aenean lacinia bibendum nulla sed consectetur."
  ],
  [
    "Benefits",
    " Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\n"
    " Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.\n\n"
    " Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.\n\n"
    " Sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt."
  ],
  [
    "Getting Started",
    " Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\n"
    " Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\n\n"
    " Curabitur pretium tincidunt lacus.\n\n"
    " Nulla gravida orci a odio, vel interdum libero scelerisque eget."
  ],
  [
    "Conclusion",
    " Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.\n\n"
    " At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.\n\n"
    " Similique sunt in culpa qui officia deserunt mollitia animi.\n\n"
    " Lorem ipsum dolor sit amet, consectetur adipiscing elit."
  ],
];
  var list = [
   
  ];
  @override
  void initState() {
     super.initState();

   if(widget.navId=="au"){
   title="About Us";
   
   

   }
   else if(widget.navId=="rp"){
   title="Refund Policy";
   list=listRp;

   }

   else{

    title="Terms & Conditions";

   list=listTc;


   }





  }
  

 @override
Widget build(BuildContext context) {
  final size = ScreenSizeUtil.getScreenSized(context);
   if(widget.navId=="au"){

    return   
    Scaffold(
      appBar:  PreferredSize(
          preferredSize: Size(size.width, size.height*.1),
          child: AuthAppBarWidegt(
            title: title,
          )),
      body: Data(headingAndText: dataList,id: "au",),
    );
   }


  return DefaultTabController(
    length:list.length, // Number of tabs
    child: Scaffold(
      appBar:  PreferredSize(
          preferredSize: Size(size.width, size.height*.1),
          child: AuthAppBarWidegt(
            title: title,
          )),
      body: Column(
        children: [




          
          Container(
            color: Colors.grey.withOpacity(.1), 
            child: TabBar(
              unselectedLabelStyle: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.normal),
              labelStyle: Theme.of(context).textTheme.titleLarge,
              labelColor: AppColors.links,
              unselectedLabelColor: Colors.grey,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  color: AppColors.links, // Custom underline color
                  width: 3.0, // Thickness of the underline
                ),
              ),
              tabs:  [
             for(int i=0;i<list.length;i++)
                Tab(text: list[i]),
              ],
            ),
          ),

          // TabBarView inside an Expanded widget to fill the remaining space
          Expanded(
            child: TabBarView(
              children: [
                SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: size.height * .05),
                    child: Column(
                      children: [
                         Data(headingAndText: dataList)
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: size.height * .05),
                    child: Column(
                      children: [
                        Data(headingAndText: dataList)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

}


class Data extends StatelessWidget {
  final List<List<String>> headingAndText;
  final String? id;

  const Data({super.key,required this.headingAndText,this.id});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return  SingleChildScrollView(
      child: Column(children: [
        if(id!=null)
           Container(margin: EdgeInsets.symmetric(horizontal: size.height*.1,vertical:size.height*.05,
            
           
           ),
           child: Image.asset(AppAssetsUrl.brandLogo,
           fit: BoxFit.cover,),
),
             
             
             for(int i=0;i<headingAndText.length;i++)
       Column(
         children: [

           HeadingsWidet(h1: headingAndText[i][0], alignment: Alignment.topLeft,
           h2: headingAndText[i][1],hasVarient: true,
           ),
          const SizedBox(
            
            width: double.infinity,
           child: Divider(color: Colors.grey,),)
         ],
       )
       


      ],),

    );
  }
}


