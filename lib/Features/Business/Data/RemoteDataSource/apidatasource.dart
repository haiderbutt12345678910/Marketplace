import 'dart:convert';

import 'package:flutter_application_ebay_ecom/AppCores/ConstStrings/ApisStrings/apiurls.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Data/Models/Bids/buyerbid_model.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Data/Models/ItemDetailsModel/itemdetail_model.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Data/Models/ItemModels/HomeItemModel/homeitem_model.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Data/Models/ItemModels/item_model.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Data/Models/ItemModels/myitem_model.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Data/Models/SavedItemsModel/saveditem_model.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Data/Models/SliderModel/slider_model.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Data/Models/cart_model.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Data/Models/category_model.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Data/Models/citites_model.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Data/Models/membership_model.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Data/Models/subcategory_model.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Data/Models/SavedItemsModel/user_model.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/Bids/buyerbid_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/user_entity.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class Apidatasource {
  Future<List<ItemModel>> getItems(int count);
    Future<List<MyItemModel>> getMyItems();
     Future<HomeitemsModel> getHomeItems();



        Future<void> deleteMyItem(String itemId);

        Future<List<SliderModel>> getSliders();


  Future<ItemDetailModel> getSingleItem(String id);
  Future<List<CategoryModel>> getCategories();
  Future<List<SubCategoryModel>> getSubCategories();
  Future<UserModel> getUser();
  Future<void> updateUser(UserUpdateEntity userEntity);


  
  Future<void> saveItem(String id);
  Future<List<SavedItemModel>> getSavedItems();
  Future<List<SavedItemModel>> getRecentItems();
      Future<void> savedeleteRecentItem(String itemId);

  

  Future<List<CitiesModel>> getCitites();


  Future<List<CartModel>> getCartItems();
  Future<void> removeCartItem(String id);
  Future<void> addCartItem(String id);
    Future<void> updateCartQuantinty(String cartId,String cartQuantity);


  Future<List<MembershipModel>> getAllMemberShips();
  Future<MembershipModel> getSingleMemberShips(String id);


    Future<List<BidEntity>> getBuyingBids();
        Future<void> createBid(String itemId,String originalPrice,String bidPrice);



}

class ApiDataSourceImpl extends Apidatasource {
  final SharedPreferences prefs;
  final http.Client httpClient;
  ApiDataSourceImpl({required this.httpClient, required this.prefs});

  @override
  Future<List<ItemModel>> getItems(int count) async {
    String itemsUrl = '${ApiUrls.baseUrl}/api/items?page=$count';

    try {
      final String? token = prefs.getString('token');

      final response = await http.get(
        Uri.parse(itemsUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final List<dynamic> itemsData = responseData['items']['data'];
        try {
          List<ItemModel> items =
              itemsData.map((item) => ItemModel.fromJson(item)).toList();

          return items;
        } catch (e) {
          throw Exception(e.toString());
        }
      } else {
        throw Exception("Error Occured");
      }
    } catch (e) {
      throw Exception("Error Occured");
    }
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
  const  String itemsUrl = '${ApiUrls.baseUrl}/api/categories';

    try {
      final String? token = prefs.getString('token');

      final response = await http.get(
        Uri.parse(itemsUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final List<dynamic> itemsData = responseData['data'];
        List<CategoryModel> items =
            itemsData.map((item) => CategoryModel.fromJson(item)).toList();
        return items;
      } else {
        throw Exception("Error Occured");
      }
    } catch (e) {
      throw Exception("Error Occured");
    }
  }

  @override
  Future<List<SubCategoryModel>> getSubCategories() async {
   const String itemsUrl = '${ApiUrls.baseUrl}/api/sub-categories';

    try {
      final String? token = prefs.getString('token');

      final response = await http.get(
        Uri.parse(itemsUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final List<dynamic> itemsData = responseData['data'];

        List<SubCategoryModel> items =
            itemsData.map((item) => SubCategoryModel.fromJson(item)).toList();
        return items;
      } else {
        throw Exception("Error Occured");
      }
    } catch (e) {
      throw Exception("Error Occured");
    }
  }

  @override
  Future<UserModel> getUser() async {
    const String itemsUrl = '${ApiUrls.baseUrl}/api/profile';

    try {
      final String? token = prefs.getString('token');

      final response = await http.get(
        Uri.parse(itemsUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final Map<String, dynamic> userData = responseData['data'];
        UserModel user = UserModel.fromJson(userData);
        return user;
      } else {
        throw Exception("Error Occurred");
      }
    } catch (e) {

      throw Exception("Error Occurred");
    }
  }

  @override
Future<void> updateUser(UserUpdateEntity userEntity) async {
  const String updateUrl = '${ApiUrls.baseUrl}/api/update-profile';

  try {
    final String? token = prefs.getString('token');
    var request = http.MultipartRequest('POST', Uri.parse(updateUrl));

    // Add headers
    request.headers.addAll({
      'Authorization': 'Bearer $token',
    });

    // Add text fields
    request.fields['name'] = userEntity.name;
    if (userEntity.cityName != null) {
      request.fields['city_name'] = userEntity.cityName!;
    }
    if (userEntity.shippingAddress != null) {
      request.fields['shipping_address'] = userEntity.shippingAddress!;
    }
    if (userEntity.permanentAddress != null) {
      request.fields['permanent_address'] = userEntity.permanentAddress!;
    }

    // Add image if exists
    if (userEntity.profileImagePath != null) {
      var imageFile = await http.MultipartFile.fromPath(
        'profile_image',
        userEntity.profileImagePath!,
      );
      request.files.add(imageFile);
    }

    // Send the request
    var response = await request.send();
    if (response.statusCode != 200) {
      throw Exception("Error Occurred");
    }
  } catch (e) {
    throw Exception("Error Occurred");
  }
}

  @override
  Future<List<CitiesModel>> getCitites() async {
    const String itemsUrl = '${ApiUrls.baseUrl}/api/cities';

    try {
      final String? token = prefs.getString('token');

      final response = await http.get(
        Uri.parse(itemsUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final List<dynamic> itemsData = responseData['data'];
        List<CitiesModel> items =
            itemsData.map((item) => CitiesModel.fromJson(item)).toList();
        return items;
      } else {
        throw Exception("Error Occurred");
      }
    } catch (e) {
      throw Exception("Error Occurred");
    }
  }

  @override
  Future<List<SavedItemModel>> getSavedItems() async {
    const String itemsUrl = '${ApiUrls.baseUrl}/api/my-saved-items';

    try {
      final String? token = prefs.getString('token');

      final response = await http.get(
        Uri.parse(itemsUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final List<dynamic> itemsData = responseData['data'];
        List<SavedItemModel> items =
            itemsData.map((item) => SavedItemModel.fromJson(item)).toList();

        return items;
      } else {
        throw Exception("Error Occurred");
      }
    } catch (e) {
      throw Exception("Error Occurred");
    }
  }

  @override
  Future<List<SavedItemModel>> getRecentItems() async {
     String itemsUrl =
        '${ApiUrls.baseUrl}/api/my-recently-viewed-items';

    try {
      final String? token = prefs.getString('token');

      final response = await http.get(
        Uri.parse(itemsUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final List<dynamic> itemsData = responseData['data'];
        List<SavedItemModel> items =
            itemsData.map((item) => SavedItemModel.fromJson(item)).toList();

        return items;
      } else {
        throw Exception("Error Occurred");
      }
    } catch (e) {
      throw Exception("Error Occurred");
    }
  }

  @override
  Future<List<CartModel>> getCartItems() async {
    const String itemsUrl = '${ApiUrls.baseUrl}/api/carts';

    try {
      final String? token = prefs.getString('token');

      final response = await http.get(
        Uri.parse(itemsUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final List<dynamic> itemsData = responseData['data'];
        List<CartModel> items =
            itemsData.map((item) => CartModel.fromJson(item)).toList();

        return items;
      } else {
        throw Exception("Error Occurred");
      }
    } catch (e) {
      throw Exception("Error Occurred");
    }
  }

  @override
  Future<List<MembershipModel>> getAllMemberShips() async {
    const String itemsUrl = '${ApiUrls.baseUrl}/api/memberships';

    try {
      final String? token = prefs.getString('token');

      final response = await http.get(
        Uri.parse(itemsUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final List<dynamic> itemsData = responseData['data'];
        List<MembershipModel> items =
            itemsData.map((item) => MembershipModel.fromJson(item)).toList();

        return items;
      } else {
        throw Exception("Error Occurred");
      }
    } catch (e) {
      throw Exception("Error Occurred");
    }
  }

  @override
  Future<MembershipModel> getSingleMemberShips(String id) async {
    String itemsUrl = '${ApiUrls.baseUrl}/api/membership/$id';

    try {
      final String? token =
          prefs.getString('token'); // Ensure prefs is initialized

      final response = await http.get(
        Uri.parse(itemsUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final Map<String, dynamic> itemData = responseData['data'];
        MembershipModel item = MembershipModel.fromJson(itemData);

        return item;
      } else {
        throw Exception("Error Occurred: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error Occurred: $e");
    }
  }

  @override
  Future<ItemDetailModel> getSingleItem(String id) async {
    String itemsUrl = '${ApiUrls.baseUrl}/api/item/$id';

    try {
      final String? token =
          prefs.getString('token'); // Ensure prefs is initialized

      final response = await http.get(
        Uri.parse(itemsUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final Map<String, dynamic> itemData = responseData['itemDetail'];

        // Assuming you have a method to parse the itemData into ItemDetailModel
        final itemDetailModel = ItemDetailModel.fromJson(itemData);

        // Return as a single-item list
        return itemDetailModel;
      } else {
        throw Exception("Error Occurred: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error Occurred: $e");
    }
  }

  @override
  Future<void> addCartItem(String id) async {
    String itemsUrl = '${ApiUrls.baseUrl}/api/add-to-cart';

    try {
      final String? token =
          prefs.getString('token'); // Ensure prefs is initialized

      final response = await http.post(
        Uri.parse(itemsUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body:  jsonEncode({'item_id': id})
      );

      if (response.statusCode == 200) {
      } else {
        throw Exception("Error Occurred: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error Occurred: $e");
    }
  }

  @override
  Future<void> removeCartItem(String id) async {
    String itemsUrl =
        '${ApiUrls.baseUrl}/api/remove-item-from-cart';

    try {
      final String? token = prefs.getString('token');

      final response = await http.post(
        Uri.parse(itemsUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
         body:  jsonEncode({'cart_id': id})
      );

      if (response.statusCode == 200) {
      } else {
        throw Exception("Error Occurred: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error Occurred: $e");
    }
  }
  
  @override
  @override
Future<void> saveItem(String id) async {
  const String updateUrl = '${ApiUrls.baseUrl}/api/store-my-saved-item'; // Correct URL with id

  try {
    final String? token = prefs.getString('token');
    if (token == null) {
      throw Exception("No token found");
    }
   

    final response = await http.post(
      Uri.parse(updateUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({'item_id': id}),
    );


    

    if(response.statusCode!=200){
         throw Exception("validation Error");

     
    }

    
  } catch (e) {
    throw Exception("Error Occurred: $e");
  }
}

  @override
  Future<List<MyItemModel>> getMyItems() async{
   const String itemsUrl = '${ApiUrls.baseUrl}/api/my-items';

    try {
      final String? token = prefs.getString('token');

      final response = await http.get(
        Uri.parse(itemsUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final List<dynamic> itemsData = responseData['data']['data'];
        List<MyItemModel> items =
            itemsData.map((item) => MyItemModel.fromJson(item)).toList();
        return items;
      } else {
        throw Exception("Error Occurred");
      }
    } catch (e) {
      throw Exception("Error Occurred");
    }
  }
  
  @override
  Future<void> deleteMyItem(String itemId) async {
    final String updateUrl = '${ApiUrls.baseUrl}/api/delete-my-item/$itemId'; // Correct URL with id

  try {
    final String? token = prefs.getString('token');
  
  
        
    final response = await http.get(
      Uri.parse(updateUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    
    );


 

    if (response.statusCode != 200) {
      throw Exception("Error Occurred: ${response.reasonPhrase}");
    }
  } catch (e) {
    throw Exception("Error Occurred: $e");
  }
   
  }
  
  @override
  Future<HomeitemsModel> getHomeItems() async {
   const String itemsUrl = '${ApiUrls.baseUrl}/api/home-items';

    try {
      final String? token = prefs.getString('token');

      final response = await http.get(
        Uri.parse(itemsUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        

        try {
          HomeitemsModel items =HomeitemsModel.fromJson(responseData);

          return items;
        } catch (e) {
          throw Exception(e.toString());
        }
      } else {
        throw Exception("Error Occured");
      }
    } catch (e) {
      throw Exception("Error Occured");
    }
  }
  
  @override
  Future<List<SliderModel>> getSliders()async {
   const String url = '${ApiUrls.baseUrl}/api/sliders';

    try {
      final String? token = prefs.getString('token');

      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ); 

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final List<dynamic> itemsData = responseData['data'];
        List<SliderModel> sliderModels =
            itemsData.map((item) => SliderModel.fromJson(item)).toList();

        return sliderModels;
      } else {
        throw Exception("Error Occurred");
      }
    } catch (e) {
      throw Exception("Error Occurred");
    }
  }
  
  @override
  Future<List<BidEntity>> getBuyingBids() async{
  const String url = '${ApiUrls.baseUrl}/api/my-bids-as-buyer';

    try {
      final String? token = prefs.getString('token');

      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ); 
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final List<dynamic> itemsData = responseData['data'];
        List<BidEntity> bidsModel =
            itemsData.map((item) => BidModel.fromJson(item)).toList();
        return bidsModel;
      } else {
        throw Exception("Error Occurred");
      }
    } catch (e) {
      throw Exception("Error Occurred");
    }
}

  @override
  Future<void> createBid(String itemId, String originalPrice, String bidPrice)async{
    const String updateUrl = '${ApiUrls.baseUrl}/api/store-my-bid-as-buyer'; // Correct URL with id

  try {
    final String? token = prefs.getString('token');
    if (token == null) {
      throw Exception("No token found");
    }
   

    final response = await http.post(
      Uri.parse(updateUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({'item_id': itemId,
      'orignal_price':originalPrice,
      'bid_price':bidPrice


      }),
    );


     if(response.statusCode==200){
      return;
     }

    if(response.statusCode==201){
         throw "You Sent offer already";

     
    }
    else if(response.statusCode==202){
         throw "Increase bid price";

     
    }

    else{

       throw "Some error occured!";
    }
    

    
  } catch (e) {
    rethrow;
  }
  }
  
  @override
  Future<void> savedeleteRecentItem(String itemId) async {
    const String updateUrl = '${ApiUrls.baseUrl}/api/store-my-recent-view-item'; // Correct URL with id

  try {
    final String? token = prefs.getString('token');
    if (token == null) {
      throw Exception("No token found");
    }
   

    final response = await http.post(
      Uri.parse(updateUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({'item_id': itemId}),
    );


    

    if(response.statusCode!=200){
         throw Exception("validation Error");

     
    }

    
  } catch (e) {
    throw Exception("Error Occurred: $e");
  }
  }
  
  @override
  Future<void> updateCartQuantinty(String cartId, String cartQuantity)async {
const String updateUrl = '${ApiUrls.baseUrl}/api/update-cart-quantity'; // Correct URL with id

  try {
    final String? token = prefs.getString('token');
    if (token == null) {
      throw Exception("No token found");
    }
   

    final response = await http.post(
      Uri.parse(updateUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({'cart_id': cartId,
      
      'quantity': cartQuantity}),
    );


      print(response.statusCode);
    

    if(response.statusCode!=200){
         throw Exception("validation Error");

     
    }

    
  } catch (e) {
    throw Exception("Error Occurred: $e");
  }
  }
}