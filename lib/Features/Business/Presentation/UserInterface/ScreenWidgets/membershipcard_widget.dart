import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Branding/appcolors.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/appelevatedbuttons.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/membership_entity.dart';

class MemberShipCardWidget extends StatelessWidget {
 final List<MembershipEntity> list;
  const MemberShipCardWidget({super.key,required this.list, });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin:const EdgeInsets.symmetric(vertical: 10,horizontal: 25),
    
      child:SingleChildScrollView(
        child: Column(children: [



         SizedBox(height: size.height*.01,),
        for (int index=0; index<list.length;index++)
        
          SizedBox(
                width: size.width,
               
                child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color:Colors.grey.withOpacity(.3),width: 1),
                      
                      borderRadius: BorderRadius.circular(30),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ListTile(
                            title: Text(
                             list[index].title,
                              style: Theme.of(context).textTheme.titleLarge!.copyWith(color: AppColors.links,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.links
                              )),
                            
                           ),
        
                            _feature("Items Per Month            ", list[index].allowProductsPerMonth, context),
                             const SizedBox(
                            height: 3,
                          ),  
                             
        
                             _feature("Sale Commission", list[index].saleCommission, context),
                             const SizedBox(
                            height: 3,
                          ),  
        
        
                          _feature("Image a llowed", list[index].imagesAllow, context),
                             const SizedBox(
                            height: 3,
                          ),  

                          _feature("item vedio allowed", list[index].allowProductVideo, context),
                             const SizedBox(
                            height: 3,
                          ),  
                           _feature("Withdrawl duration", list[index].withdrawDuration, context),
                             const SizedBox(
                            height: 3,
                          ), 
                          const SizedBox(
                            height: 10,
                          ),
                           ElevatedButtonWidget(buttonSize: null, function: (){
        
                           }, buttonText: "Updrage")
                        ],
                      ),
                    )),
              )
        ],),
      ),
    );
  }


  Widget _feature(String text, String val,BuildContext context){

  return Padding(
    padding:const EdgeInsets.only(left: 15),
    child: RichText(
    text: TextSpan(
      children: [
          TextSpan(
          text:'•  ',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(color:Colors.black,fontWeight: FontWeight.bold),
        ),
         
        TextSpan(
          text:'$val  $text',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(color:Colors.black,fontWeight: FontWeight.bold),
        ),
        
      ],
    ),
    ),
  );



  }
}