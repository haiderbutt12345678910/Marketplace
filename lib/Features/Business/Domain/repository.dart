import 'package:dartz/dartz.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Errors/exceptions.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/Bids/buyerbid_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/ItemDetailsEntity/itemdetail_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/ItemsEntites/HomeItems/homeitems_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/ItemsEntites/item_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/ItemsEntites/myitem_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/Sliders/slider_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/category_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/citites_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/membership_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/SavedItems/saveitem_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/subcategory_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/user_entity.dart';

import 'Entities/cart_entity.dart';

abstract class Repository {
  const Repository();

  Future<Either<Failure, List<ItemEntity>>> getItems(int count);
    Future<Either<Failure, List<MyItemEntity>>> getMyItems();
   Future<Either<Failure, HomeitemsEntity>> geHomeItems();
 Future<Either<Failure, void>> deleteMyItem(String itemId);





//sliders

   Future<Either<Failure, List<SliderEntity>>> getSliders();


  Future<Either<Failure, ItemDetailEntity>> getSingleItem(String id);

  Future<Either<Failure, List<CategoryEntity>>> getCategories();
  Future<Either<Failure, List<SubCategoryEntity>>> getSubCategories();


  //User

  Future<Either<Failure, UserEntity>> getUser();
  Future<Either<Failure, void>> updateUser(UserUpdateEntity userEntity);

  Future<Either<Failure, List<CitiesEntity>>> getCitites();

  //for recently viewd and saved items both
  Future<Either<Failure, List<SavedItemEntity>>> getSavedItems();
  Future<Either<Failure, List<SavedItemEntity>>> getrecentItems();

  //for botg deleting and saving
  Future<Either<Failure, void>> saveItem(String itemId);
    Future<Either<Failure, void>> savedeleteRecentItem(String itemId);



  Future<Either<Failure, List<CartEntity>>> getCartItems();
  Future<Either<Failure, void>> removeCartItem(String id);
  Future<Either<Failure, void>> addCartItem(String id);
  Future<Either<Failure, void>> updateCartQuantinty(String cartId,String cartQuantity);


  Future<Either<Failure, List<MembershipEntity>>> getAllMemberships();
  Future<Either<Failure, MembershipEntity>> getSingleMembership(String id);

  //bids
  // Future<Either<Failure, void>> setBidAsBuyer(String itemId, String originalPrice,String bidPrice);
   Future<Either<Failure, List<BidEntity>>> getBuyingBids();
    Future<Either<Failure, void>> createBid(String itemId,String originalPrice,String bidPrice);




  

}
