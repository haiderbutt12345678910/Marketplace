import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Branding/appcolors.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ScreenSizeUtils/screensize.dart';

class OrderWidget extends StatefulWidget {
  const OrderWidget({super.key});

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  final List<String> statusItems = ['Active', 'Non Active'];
  late String? selectedStatus = 'Active';

  final List<String> dateItems = ['Last Week', 'Last Month', 'Last 3 Days'];
  late String? selectedDate = 'Last 3 Days';

  final product = [
    {
      "imageUrl":
          "https://tse3.mm.bing.net/th?id=OIP.fFw-qnW_uMZqAtNAQDvghQHaIq&pid=Api&P=0&h=220",
      "title":
          "Big Floors DT40GRAY DuraGrid Outdoor Modular Interlocking Multi-Use Plastic Deck Tile, 40 Pack, Gray",
      "description":
          "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.LOREM IPSUM GENERATOR",
      "price": '19.99',
      "discountedPrice": '14.99',
    },
    {
      "imageUrl":
          "https://tse3.mm.bing.net/th?id=OIP.fFw-qnW_uMZqAtNAQDvghQHaIq&pid=Api&P=0&h=220",
      "title":
          "Big Floors DT40GRAY DuraGrid Outdoor Modular Interlocking Multi-Use Plastic Deck Tile, 40 Pack, Gray",
      "description":
          "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.LOREM IPSUM GENERATOR",
      "price": '19.99',
      "discountedPrice": '14.99',
    },
    {
      "imageUrl":
          "https://tse3.mm.bing.net/th?id=OIP.fFw-qnW_uMZqAtNAQDvghQHaIq&pid=Api&P=0&h=220",
      "title":
          "Big Floors DT40GRAY DuraGrid Outdoor Modular Interlocking Multi-Use Plastic Deck Tile, 40 Pack, Gray",
      "description":
          "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.LOREM IPSUM GENERATOR",
      "price": '19.99',
      "discountedPrice": '14.99',
    },
    {
      "imageUrl":
          "https://tse3.mm.bing.net/th?id=OIP.fFw-qnW_uMZqAtNAQDvghQHaIq&pid=Api&P=0&h=220",
      "title":
          "Big Floors DT40GRAY DuraGrid Outdoor Modular Interlocking Multi-Use Plastic Deck Tile, 40 Pack, Gray",
      "description":
          "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.LOREM IPSUM GENERATOR",
      "price": '19.99',
      "discountedPrice": '14.99',
    },
    {
      "imageUrl":
          "https://tse3.mm.bing.net/th?id=OIP.fFw-qnW_uMZqAtNAQDvghQHaIq&pid=Api&P=0&h=220",
      "title":
          "Big Floors DT40GRAY DuraGrid Outdoor Modular Interlocking Multi-Use Plastic Deck Tile, 40 Pack, Gray",
      "description":
          "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.LOREM IPSUM GENERATOR",
      "price": '19.99',
      "discountedPrice": '14.99',
    },
    {
      "imageUrl":
          "https://tse3.mm.bing.net/th?id=OIP.fFw-qnW_uMZqAtNAQDvghQHaIq&pid=Api&P=0&h=220",
      "title":
          "Big Floors DT40GRAY DuraGrid Outdoor Modular Interlocking Multi-Use Plastic Deck Tile, 40 Pack, Gray",
      "description":
          "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.LOREM IPSUM GENERATOR",
      "price": '19.99',
      "discountedPrice": '14.99',
    },
    {
      "imageUrl":
          "https://tse3.mm.bing.net/th?id=OIP.fFw-qnW_uMZqAtNAQDvghQHaIq&pid=Api&P=0&h=220",
      "title":
          "Big Floors DT40GRAY DuraGrid Outdoor Modular Interlocking Multi-Use Plastic Deck Tile, 40 Pack, Gray",
      "description":
          "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.LOREM IPSUM GENERATOR",
      "price": '19.99',
      "discountedPrice": '14.99',
    },
    {
      "imageUrl":
          "https://tse3.mm.bing.net/th?id=OIP.fFw-qnW_uMZqAtNAQDvghQHaIq&pid=Api&P=0&h=220",
      "title":
          "Big Floors DT40GRAY DuraGrid Outdoor Modular Interlocking Multi-Use Plastic Deck Tile, 40 Pack, Gray",
      "description":
          "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.LOREM IPSUM GENERATOR",
      "price": '19.99',
      "discountedPrice": '14.99',
    },
    {
      "imageUrl":
          "https://tse3.mm.bing.net/th?id=OIP.fFw-qnW_uMZqAtNAQDvghQHaIq&pid=Api&P=0&h=220",
      "title":
          "Big Floors DT40GRAY DuraGrid Outdoor Modular Interlocking Multi-Use Plastic Deck Tile, 40 Pack, Gray",
      "description":
          "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.LOREM IPSUM GENERATOR",
      "price": '19.99',
      "discountedPrice": '14.99',
    },
    {
      "imageUrl":
          "https://tse3.mm.bing.net/th?id=OIP.fFw-qnW_uMZqAtNAQDvghQHaIq&pid=Api&P=0&h=220",
      "title":
          "Big Floors DT40GRAY DuraGrid Outdoor Modular Interlocking Multi-Use Plastic Deck Tile, 40 Pack, Gray",
      "description":
          "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.LOREM IPSUM GENERATOR",
      "price": '19.99',
      "discountedPrice": '14.99',
    },
    {
      "imageUrl":
          "https://tse3.mm.bing.net/th?id=OIP.fFw-qnW_uMZqAtNAQDvghQHaIq&pid=Api&P=0&h=220",
      "title":
          "Big Floors DT40GRAY DuraGrid Outdoor Modular Interlocking Multi-Use Plastic Deck Tile, 40 Pack, Gray",
      "description":
          "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.LOREM IPSUM GENERATOR",
      "price": '19.99',
      "discountedPrice": '14.99',
    },
    {
      "imageUrl":
          "https://tse3.mm.bing.net/th?id=OIP.fFw-qnW_uMZqAtNAQDvghQHaIq&pid=Api&P=0&h=220",
      "title":
          "Big Floors DT40GRAY DuraGrid Outdoor Modular Interlocking Multi-Use Plastic Deck Tile, 40 Pack, Gray",
      "description":
          "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.LOREM IPSUM GENERATOR",
      "price": '19.99',
      "discountedPrice": '14.99',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = ScreenSizeUtil.getScreenSized(context);

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          filters(context, size),
          SizedBox(
            height: size.height * .7,
            child:
                SingleChildScrollView(child: _dataTableFunction(context, size)),
          )
        ],
      ),
    );
  }

  Widget filters(BuildContext context, Size size) {
    return Row(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: DropdownButton2<String>(
              style: Theme.of(context).textTheme.titleMedium,
              isExpanded: false,
              iconStyleData: IconStyleData(
                  icon: Icon(
                Icons.arrow_downward,
                color: AppColors.iconsVaraintDarkTheme,
              )),
              hint: Text('Status',
                  style: Theme.of(context).textTheme.titleMedium!),
              value: selectedStatus,
              onChanged: (value) => setState(() => selectedStatus = value),
              items: statusItems
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
        const SizedBox(width: 10), // Add some spacing between dropdowns
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: DropdownButton2<String>(
              hint: Text(
                'Date',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              value: selectedDate,
              iconStyleData: IconStyleData(
                  icon: Icon(
                Icons.arrow_downward,
                color: AppColors.iconsVaraintDarkTheme,
              )),
              onChanged: (value) => setState(() => selectedDate = value),
              items:
                  selectedStatus == 'Active' || selectedStatus == 'Non Active'
                      ? dateItems
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                ),
                              ))
                          .toList()
                      : [], // Disable date dropdown for other options
            ),
          ),
        ),
      ],
    );
  }

  Widget _dataTableFunction(BuildContext context, Size size) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingTextStyle: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.bold),
        columns: const [
          DataColumn(label: Text('Items')),
          DataColumn(label: Text('Status')),
          DataColumn(label: Text('Total Amount')),
          DataColumn(label: Text('Ordered Date')),
          DataColumn(
            label: Text('Shipping Adress'),
          ),
          DataColumn(
            label: Text('Shipping Date'),
          ),
        ],
        rows: [
          for (int i = 0; i < product.length; i++)
            DataRow(cells: [
              DataCell(SizedBox(
                width: size.width * .3,
                child: Text(
                  product[i]['title'] as String,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              )),
              DataCell(Text(i % 2 == 0 ? 'Pending' : 'Delivered',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: i % 2 == 0 ? Colors.yellowAccent : Colors.green))),
              DataCell(Text("\$${product[i]["discountedPrice"] as String}",
                  style: Theme.of(context).textTheme.titleSmall)),
              DataCell(Text('2024-05-06',
                  style: Theme.of(context).textTheme.titleSmall)),
              DataCell(Text('House 123,st 1929,G10 MARKAZ,iSLAMEAD,Pakitan',
                  style: Theme.of(context).textTheme.titleSmall)),
              DataCell(Text('2024-05-10',
                  style: Theme.of(context).textTheme.titleSmall)),
            ]),

          // Add more DataRow widgets for additional entries
        ],
      ),
    );
  }
}
