import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Branding/appcolors.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ScreenSizeUtils/screensize.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/CoreWidgets/FeaturesCoreWidgets/searchfeild_widget.dart';

class ListingWidet extends StatefulWidget {
  const ListingWidet({super.key});

  @override
  State<ListingWidet> createState() => _ListingWidetState();
}

class _ListingWidetState extends State<ListingWidet> {
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
    return const SearchFeildWidget(
      isSeacrhPage: false,
    );
  }

  Widget _dataTableFunction(BuildContext context, Size size) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingRowColor:
            WidgetStateProperty.all<Color>(AppColors.bgVariantDarkTheme),
        dividerThickness: 2,
        headingTextStyle: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.bold),
        columns: const [
          DataColumn(label: Text('Image')),
          DataColumn(label: Text('Items Name')),
          DataColumn(label: Text('Price')),
          DataColumn(label: Text('Discounted Price')),
          DataColumn(label: Text('Condition')),
          DataColumn(
            label: Text('description'),
          ),
          DataColumn(
            label: Text('Shipping Cost'),
          ),
          DataColumn(
            label: Text('Ship Time'),
          ),
        ],
        rows: [
          for (int i = 0; i < product.length; i++)
            DataRow(cells: [
              DataCell(SizedBox(
                width: size.width * .2,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  height: size.height * .04,
                  width: double.infinity,
                  child: SizedBox(
                    height: size.height * .02,
                    child: Image.network(
                      product[i]["imageUrl"] as String,
                      width: double.infinity,
                    ),
                  ),
                ),
              )),
              DataCell(SizedBox(
                width: size.width * .4,
                child: Text(
                  product[i]['title'] as String,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              )),
              DataCell(Text("\$${product[i]["price"] as String}",
                  style: Theme.of(context).textTheme.titleSmall)),
              DataCell(Text("\$${product[i]["discountedPrice"] as String}",
                  style: Theme.of(context).textTheme.titleSmall)),
              DataCell(
                  Text('New', style: Theme.of(context).textTheme.titleSmall)),
              DataCell(SizedBox(
                width: size.width * .5,
                child: Text(product[i]['description'] as String,
                    style: Theme.of(context).textTheme.titleSmall),
              )),
              DataCell(Text("\$${product[i]["discountedPrice"] as String}",
                  style: Theme.of(context).textTheme.titleSmall)),
              DataCell(Text('7 days',
                  style: Theme.of(context).textTheme.titleSmall)),
            ]),

          // Add more DataRow widgets for additional entries
        ],
      ),
    );
  }
}
