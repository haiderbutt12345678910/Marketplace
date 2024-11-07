import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/BlocStates/blocstates.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ConstStrings/AssetsStrings/assetsurl.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/appelevatedbuttons.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/circularprogess.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/pageheadings.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ScreenSizeUtils/screensize.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/ItemsEntites/item_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/cart_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/cart_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/getitems_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/CoreWidgets/FeaturesCoreWidgets/productoverview_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<ItemEntity> list = [];
  double totalPrice = 0;

 
bool _isChecked = true;
    List<String> items = ["Deliver out of city", "Option 2", "Option 3", "Option 4"];

  
int currentQuantity = 1;
  @override
  void initState() {
    super.initState();
   // BlocProvider.of<GetCartBloc>(context).getCat();

  }

  @override
  Widget build(BuildContext context) {
    final size = ScreenSizeUtil.getScreenSized(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
      
        backgroundColor: Colors.white,
        title: Text(
          "My Cart",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
        ),
        elevation: 1,
        centerTitle: false,
      ),
      body: _cart(context, size),
    );
  }

  Widget _cart(BuildContext context, Size size) {
    return BlocBuilder<GetCartBloc, BlocStates>(builder: (ctx, state) {
      var cartList = BlocProvider.of<GetCartBloc>(context).getLocalList();

           list = BlocProvider.of<GetitemsBloc>(context).getCartList(cartList);

      if (state is Loading) {
        if(cartList.isNotEmpty){

          return  Stack(children: [

               SingleChildScrollView(
  child: ConstrainedBox(
    constraints: BoxConstraints(
      minHeight: size.height, // Constraint the height to the screen size
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
                    padding:const EdgeInsets.all(10),
                    width: double.infinity,
                  color: Colors.grey.withOpacity(.1),
                  child:HeadingsWidet(h1: "Cart items (${cartList.length})", alignment: Alignment.topLeft),


                  ),
          Column(
            children: List.generate(list.length, (i) {
              return _buildProductItem(context, size, i, cartList[i]);
            }),
          ),
          const SizedBox(height: 16),
          _orderSummary(context, size, cartList.length, totalPrice, () {}, () {}),
          const SizedBox(height: 16),
          // HeadingsWidet(
          //   h1: "Frequently Bought Together",
          //   alignment: Alignment.topLeft,
          // ),
        // __section4(context, size),
        ],
      ),
    ),
  ),
),
   const ProgressCircularIndicatorCustom()


          ],);
        }
        return const ProgressCircularIndicatorCustom();
      } else if (state is Sucessfull) {
        totalPrice = 0;
  if(cartList.isEmpty){

    return SizedBox(
          height: size.height,
          width: double.infinity,
          child: Center(
            child: InkWell(
              onTap: () {
                 
             
              },
              child: HeadingsWidet.withH1Icon(
                iconData: (Icons.refresh),
                h1: "Your cart is empty",
                alignment: Alignment.center,
                h2: "Explore products and add to cart now!",
              ),
            ),
          ),
        );
  }
       return SingleChildScrollView(
  child: ConstrainedBox(
    constraints: BoxConstraints(
      minHeight: size.height, // Constraint the height to the screen size
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
                    padding:const EdgeInsets.all(10),
                    width: double.infinity,
                  color: Colors.grey.withOpacity(.1),
                  child:HeadingsWidet(h1: "Cart items (${cartList.length})", alignment: Alignment.topLeft),


                  ),
          Column(
            children: List.generate(list.length, (i) {
              return _buildProductItem(context, size, i, cartList[i]);
            }),
          ),
          const SizedBox(height: 16),
          _orderSummary(context, size, cartList.length, totalPrice, () {}, () {}),
          const SizedBox(height: 16),
          // HeadingsWidet(
          //   h1: "Frequently Bought Together",
          //   alignment: Alignment.topLeft,
          // ),
        // __section4(context, size),
        ],
      ),
    ),
  ),
);
      } else {
        return const SizedBox();
      }
    });
  }




  Widget _buildProductItem(BuildContext context, Size size, int index, var cartItem) {
    double price = (list[index].buyItNowPrice is String)
        ? double.tryParse(list[index].buyItNowPrice.toString()) ?? 0.0
        : (list[index].buyItNowPrice ?? 0.0);
    
    double quantity = (cartItem.quantity is String)
        ? double.tryParse(cartItem.quantity) ?? 0.0
        : cartItem.quantity.toDouble();

    double actualPrice = price * quantity;
    totalPrice += actualPrice;

   return Card(
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Leading Image
        Container(
          margin:const EdgeInsets.only(top: 15) ,
          padding: const EdgeInsets.all(10),
          color: Colors.grey.withOpacity(.3),
          width: size.width * 0.2,
          height: size.width * 0.15,
          child: Image.network(
            AppAssetsUrl.fallbackImageUrl,
            width: size.width * 0.1,
            height: size.width * 0.1,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(width: size.width * 0.04), // Space between image and details
        // Title and Category Column
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               SizedBox(height: size.height*.015,),

              Text(
                list[index].itemTitle as String,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
               
               SizedBox(height: size.height*.003,),

                 Text(
                list[index].categoryEntityItemDetail!.categoryName as String,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
              ),
                          SizedBox(height: size.height*.01,),

              Text(
          'RS ${actualPrice.toStringAsFixed(2)}',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.amber),
          overflow: TextOverflow.ellipsis,
        ),
            ],
          ),
        ),
    
        Column(
      children: [
        // Price
        
        // Delete Button
        IconButton(
          onPressed: () {
            BlocProvider.of<GetCartBloc>(context).removeCart(cartItem.id, context);
          },
          icon: const Icon(Icons.close,color: Colors.red,size: 15,),
        ),
            // Row 3: Quantity Control
    Container(
      alignment: Alignment.bottomRight,
      child: _quantityControl(context, index, cartItem),
    ),
      ],
    ),
    
      ],
    ),
  ),
);

  }

Widget _quantityControl(BuildContext context, int index, CartEntity cartItem) {
    return Container(
      margin: const EdgeInsets.only(top: 2),
      height: 30, // Fixed height for better UI
      width: 100, 
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.withOpacity(.3),
         width: 2
        )
      ),// Adjust width as needed
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Decrement button (-)
          Expanded(
            child: GestureDetector(
              onTap: () {
                if(cartItem.quantity.toString()=="0"){
                      return;
                    }
                    
                    int quantity = int.parse(cartItem.quantity); 
                    
                   quantity--; 
                   
                  BlocProvider.of<GetCartBloc>(context).updateCartQuantinty(cartItem.id, quantity.toString(), context);

              },
              child:const Icon(Icons.remove, color: Colors.green,size: 18,),
            ),
          ),
          // Quantity value display
          Expanded(
            child: Container(
              alignment: Alignment.center,
              height: double.infinity,
              color: Colors.grey.withOpacity(.2),
              child: Text(
                cartItem.quantity.toString(),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold), // Style for the counter value
              ),
            ),
          ),
          // Increment button (+)
          Expanded(
            child: GestureDetector(
              onTap: () {

               
                    
                    int quantity = int.parse(cartItem.quantity); 
                    
                   quantity++; 
                   
                  BlocProvider.of<GetCartBloc>(context).updateCartQuantinty(cartItem.id, quantity.toString(), context);
               
              
              },
              child:const Icon(Icons.add, color: Colors.green,size: 18,),
            ),
          ),
        ],
      ),
    );
  }


   Widget _orderSummary(BuildContext context, Size size, int itemCount, double totalPrice, Function onApplyVoucher, Function onCheckout) {
 
 
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: EdgeInsets.all(size.width * 0.03), // Adjust padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
          // Location
          Text(
            "Estimated Deleviry",
            style: Theme.of(context).textTheme.titleLarge,
          ),
         const SizedBox(height: 8),
          Text(
            
            "Standard shipping between 5 to 10 days",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: size.height * 0.02),

          // Subtotal
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Subtotal ($itemCount items)",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                'Rs. ${totalPrice.toStringAsFixed(0)}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          SizedBox(height: size.height * 0.02),

          // Shipping Fee
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Shipping Fee",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                'Rs. 0', // You can dynamically set the shipping fee
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          SizedBox(height: size.height * 0.02),

          // Voucher Code
          // Row(
          //   children: [
          //     Expanded(
          //       flex: 2,
          //       child: SizedBox(
          //         height: size.height*.05,
          //         child: TextFormField(
                    
          //           decoration: InputDecoration(
          //             hintStyle:const TextStyle(fontSize: 10),
          //             hintText: "Enter Voucher Code",
          //             border: OutlineInputBorder(
          //               borderRadius: BorderRadius.circular(5),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          // const    SizedBox(width: 8),
          //   Expanded(child: ElevatedButtonWidget(isSmallBtn: true, function: (){}, buttonText: 'Apply', buttonSize: null))

          //   ],
          // ),
Padding(
  padding: const EdgeInsets.only(right: 100),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      CupertinoCheckbox(
        
        value: _isChecked, // Boolean value for whether it's checked or not
        onChanged: (bool? value) {
          setState(() {
            _isChecked = value ?? false;
          });
        },
        activeColor: Colors.green, // Checkbox color when selected
        shape: const CircleBorder(), // Make it rounded
      ),
       Text(
        'Delivey out of city', // Text next to the checkbox
        style: Theme.of(context).textTheme.titleMedium,
      ),
    ],
  ),
),
          SizedBox(height: size.height * 0.02),

        
          // Total
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'Rs. ${totalPrice.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.amber),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.02),

          // Proceed to Checkout
          ElevatedButtonWidget(buttonSize: null, function: (){}, buttonText: 'Checkout')
        ],
      ),
    ),
  );
}

  // Helper method to update the total price
}

 

 
  Widget __section4(BuildContext context, Size size) {
    var itemlist = BlocProvider.of<GetitemsBloc>(context).getLocalList();
    return BlocBuilder<GetitemsBloc, BlocStates>(builder: (ctx, state) {
      return Column(
        children: [
          SizedBox(height: size.height * .01),
          SizedBox(
            height: size.height * .329, // Fixed height for ListView
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: itemlist.length > 20 ? 20 : itemlist.length, // Adjust number of items based on your data
              itemBuilder: (context, index) {
                return ProductOverViewWidget(
                  navId: "cart",
                  
                  isHorizontal: true,
                  size: size,
                  itemEntity: itemlist[index],
                  blocStates: state,
                );
              },
            ),
          ),
        ],
      );
    });
  }

