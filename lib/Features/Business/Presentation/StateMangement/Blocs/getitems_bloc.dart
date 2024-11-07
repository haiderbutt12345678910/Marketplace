import 'package:flutter_application_ebay_ecom/AppCores/BlocStates/blocstates.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/ItemsEntites/item_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/ItemsEntites/myitem_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/cart_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/SavedItems/saveitem_entity.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Domain/UseCases/getitems_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetitemsBloc extends Cubit<BlocStates> {
  final GetitemsUsecase getItemsUseCase;

  List<ItemEntity> itemList = [];

  GetitemsBloc({required this.getItemsUseCase}) : super(Initial());

  Future<void> getItems(int count) async {
    emit(Loading());

    final result = await getItemsUseCase.call(count);

    result.fold(
      (failure) {
        emit(Failure());
      },
      (items) {
        itemList.addAll(items);
         


        emit(Sucessfull());
      },
    );
  }

  List<ItemEntity> getLocalList() {
    return itemList;
  }

  List<ItemEntity> getnameFiltered(String itemTitle) {
    return itemList
        .where((item) =>
            item.itemTitle!.toLowerCase().contains(itemTitle.toLowerCase()))
        .toList();
  }

  List<ItemEntity> getsubCatFiltered(String subCategoryId) {
    return itemList
        .where((item) => item.subCategoryId!
            .toLowerCase()
            .contains(subCategoryId.toLowerCase()))
        .toList();
  }

  List<ItemEntity> getLocalListFreeShipping() {
    return itemList.where((item) => item.shippingPrice == 0.0).toList();
  }

  List<ItemEntity> getLocalListRecentlyVied(
      List<SavedItemEntity> savedItemList) {
        
    return itemList.where((item) {
      return savedItemList.any((savedItem) => savedItem.itemId == item.id);
    }).toList();
  }



   List<ItemEntity> getLocalMyItemList(
      List<MyItemEntity> myItemsList) {
    // Get IDs of saved items
    // Assuming itemList is already defined in your class
    // Filter the itemList based on matching IDs from the savedItemList
    return itemList.where((item) {
      return myItemsList.any((savedItem) => savedItem.id == item.id);
    }).toList();
  }
List<ItemEntity> getCartList(List<CartEntity> cartItems) {
  // Create a set to hold unique matched items (Set ensures no duplicates)
  Set<ItemEntity> matchedItems = {};

  for (var cartItem in cartItems) {
    for (var item in itemList) {
      if (cartItem.itemId== item.id) {
        matchedItems.add(item);
      }
    }
  }

  // Convert the set to a list to return
  return matchedItems.toList();
}



List<ItemEntity> getMultiFilteredList({
  required List<String> selectedFilters,
  required String selectedCategoryId, // Category selected from dropdown
}) {
  List<ItemEntity> filteredList = [];

  for (var item in itemList) {
    bool includeItem = true;

    // Allow all items if 'All' is selected, otherwise filter by category
    if (selectedCategoryId != 'All' &&
        item.categoryEntityItemDetail!.categoryName != selectedCategoryId) {
      continue; // Skip if the category doesn't match
    }

    // Apply checkbox filters
    for (var filter in selectedFilters) {
      switch (filter) {
        case 'New Item':
          if (item.condition?.toLowerCase() != 'new') {
            includeItem = false;
          }
          break;

        case 'Used Item':
          if (item.condition?.toLowerCase() != 'used') {
            includeItem = false;
          }
          break;

        case 'Free Shipping':
          if (item.shippingPrice != 0.0) {
            includeItem = false;
          }
          break;

        case 'Auction':
          if (item.saleType?.toLowerCase() != 'auction') {
            includeItem = false;
          }
          break;

        default:
          break;
      }

      if (!includeItem) break; // Exit the filter loop if item is excluded
    }


    if (includeItem) {
      filteredList.add(item);
    }
  }

  // Sorting by price if 'Price High to Low' is selected
  if (selectedFilters.contains('Price High to Low')) {
    filteredList.sort((a, b) {
      // Null-coalescing operator used to handle potential null values
      final priceA = a.buyItNowPrice ?? 0.0;
      final priceB = b.buyItNowPrice ?? 0.0;
      return priceB.compareTo(priceA); // Sort descending
    });
  }
  
  return filteredList;
}

}
