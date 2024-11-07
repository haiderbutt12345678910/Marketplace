import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Branding/appcolors.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ScreenSizeUtils/screensize.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/CoreWidgets/businessappbarwidet.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/Screens/singlechatmassege.dart';


class MassegedOverView extends StatelessWidget {
  MassegedOverView({super.key});

  final list = [
    [
      Icons.favorite_outlined,
      'Saved',
    ],
    [
      Icons.refresh,
      'Buy Again',
    ],
    [
      Icons.pan_tool_sharp,
      'Bids and offers',
    ],
  ];
  @override
  Widget build(BuildContext context) {
    final size = ScreenSizeUtil.getScreenSized(context);
   
  return DefaultTabController(
  length: 2, // Length is set to 2 for two tabs
  child: Scaffold(
    appBar: PreferredSize(
      preferredSize: Size(double.infinity, size.height * 0.15),
      child: Column(
        children: [
          const BusinessAppBarWidget(),
          TabBar(
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
            tabs:const [
              Tab(text: 'My Chat'),
              Tab(text: 'Customer Support'),
            ],
            indicatorColor: Colors.blue, // Customize the indicator color if needed
          ),
        ],
      ),
    ),
    body: TabBarView(
      children: [
        masseges(context, size), // Content for "My Chat" tab
              masseges(context, size), // Content for "My Chat" tab

      ],
    ),
  ),
);
  }


  Widget masseges(BuildContext context,Size size){
   return   SizedBox(
            height: size.height,
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (ctx, index) {
                  return SizedBox(
                    width: double.infinity,
                    child: ListTile(
                      onTap: (){
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const Singlechatmassege(),
  ),
);                      },
                      contentPadding: const EdgeInsets.all(8),
                      trailing: index % 2 == 0
                          ? CircleAvatar(
                          
                              radius: 8,
                              backgroundColor: Colors.redAccent,
                              child: Text(
                                "1",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                              ),
                            )
                          : null,
                      leading: const CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                              "https://tse4.mm.bing.net/th?id=OIP.BwHcg0ki1TiNyU_ihIV-SgHaHa&pid=Api&P=0&h=220")),
                      title: Text(
                        "Card RushInc",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                      subtitle: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
                        maxLines: 2,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: index % 2 == 0
                                ? FontWeight.bold
                                : FontWeight.w300),
                      ),
                    ),
                  );
                }));



  }
}
