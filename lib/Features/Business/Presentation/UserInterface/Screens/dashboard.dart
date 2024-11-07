import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/CoreWidgets/DashBoardWidegts/listing_widget.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/CoreWidgets/DashBoardWidegts/order_widget.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/Screens/createlisting.dart';

import '../../../../../AppCores/CoreWidgets/appbartitle.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CreateListingScreen()),
              );
            },
            label: const Text("List new product")),
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const AppBarTtile(),
          bottom: const TabBar(
            isScrollable: true, // Enable scrolling for many tabs
            tabs: [
              Tab(text: 'Order'),
              Tab(text: 'Listing'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            // Contents of each tab
            Center(child: OrderWidget()),
            Center(child: ListingWidet()),
          ],
        ),
      ),
    );
  }
}
