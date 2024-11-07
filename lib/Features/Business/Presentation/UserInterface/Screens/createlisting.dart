import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Branding/appcolors.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/appelevatedbuttons.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/pageheadings.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ScreenSizeUtils/screensize.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

import '../../../../../AppCores/CoreWidgets/appbartitle.dart';

class CreateListingScreen extends StatefulWidget {
  const CreateListingScreen({super.key});

  @override
  State<CreateListingScreen> createState() => _CreateListingScreenState();
}

class _CreateListingScreenState extends State<CreateListingScreen> {
  final TextEditingController _titletextEditingController =
      TextEditingController();
  final MultiSelectController _categoriestextEditingController =
      MultiSelectController();

  final MultiSelectController _colortxtEditingController =
      MultiSelectController();
  final MultiSelectController _sizetxtEditingController =
      MultiSelectController();
  final MultiSelectController _condtiontxtEditingController =
      MultiSelectController();

  final TextEditingController _descriptiontextEditingController =
      TextEditingController();

  final TextEditingController _pricetextEditingController =
      TextEditingController();
  final TextEditingController _discounttextEditingController =
      TextEditingController();

  final TextEditingController _shippingCostEditingController =
      TextEditingController();
  final PageController _pageController = PageController();
  File? image;

  @override
  void dispose() {
    _colortxtEditingController.dispose();
    _sizetxtEditingController.dispose();
    _condtiontxtEditingController.dispose();
    _categoriestextEditingController.dispose();
    _pricetextEditingController.dispose();
    _discounttextEditingController.dispose();
    _shippingCostEditingController.dispose();
    _pageController.dispose();
    _descriptiontextEditingController.dispose();
    _titletextEditingController.dispose();
    super.dispose();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>(); // Create a GlobalKey

  @override
  Widget build(BuildContext context) {
    final size = ScreenSizeUtil.getScreenSized(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      key: _scaffoldKey,
      appBar: AppBar(
        title: const AppBarTtile(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: PageView(
            controller: _pageController,
            children: [
              _category(context, size),
              _title(context, size),
              _descrtiption(context, size),
              _thumbNail(context, size),
              _pricing(context, size),
              _variations(context, size),
              _condition(context, size),
            ],
          ),
        ),
      ),
    );
  }

  Widget _title(BuildContext context, Size size) {
    return SizedBox(
      height: size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: size.height * .1),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * .1,
                ),
                HeadingsWidet(
                    h1: "Enrter the product tile",
                    h2: "The title should contain short descriotion of the product you are selling",
                    alignment: Alignment.center),
              ],
            ),
          ),
          Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                horizontal: size.height * .03,
              ),
              child: _textFeild(
                _titletextEditingController,
                "Enter Product Tilte",
                100,
                TextInputType.emailAddress,
              )),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: size.height * .01),
            child: ElevatedButtonWidget(
                bgColor: Colors.orangeAccent,
                buttonSize: null,
                function: () {
                  if (_titletextEditingController.text.isNotEmpty) {
                    _toNextPage();
                  } else {
                    showMySnackBar(context, "Title can not be empty");
                  }
                },
                buttonText: "Proceed"),
          ),
        ],
      ),
    );
  }

  Widget _descrtiption(BuildContext context, Size size) {
    return SizedBox(
      height: size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: size.height * .1),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * .1,
                ),
                HeadingsWidet(
                    h1: "Enrter the product tile",
                    h2: "Describe the product breifly should contain descriotion of the product you are selling",
                    alignment: Alignment.center),
              ],
            ),
          ),
          Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                horizontal: size.height * .03,
              ),
              child: _textFeild(
                _descriptiontextEditingController,
                "Enter Product description",
                500,
                TextInputType.emailAddress,
              )),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: size.height * .01),
            child: ElevatedButtonWidget(
                bgColor: Colors.orangeAccent,
                buttonSize: null,
                function: () {
                  if (_descriptiontextEditingController.text.isNotEmpty) {
                    _toNextPage();
                  } else {
                    showMySnackBar(context, "description can not be empty");
                  }
                },
                buttonText: "Proceed"),
          ),
        ],
      ),
    );
  }

  Widget _textFeild(TextEditingController textEditingController, String hint,
      int maxLenght, TextInputType textInputType) {
    return TextField(
      cursorHeight: 30,
      cursorColor: AppColors.cursorColor,
      textAlign: TextAlign.left,
      keyboardType: textInputType,
      controller: textEditingController,
      decoration: InputDecoration(
        counterText: maxLenght.toString(),
        hintText: hint,
      ),
      maxLength: maxLenght,
    );
  }

  Widget _pricing(BuildContext context, Size size) {
    return SizedBox(
      height: size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: size.height * .1),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * .1,
                ),
                HeadingsWidet(
                    h1: "Set Pricing for the products",
                    h2: "Set product price in usd this will be converted to local pricing  shipping cost and discounted price for the product",
                    alignment: Alignment.center),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    HeadingsWidet(
                        h1: "",
                        h2: "Product Price",
                        alignment: Alignment.topLeft),
                    SizedBox(
                      height: size.height * .03,
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: size.height * .03,
                        ),
                        child: _textFeild(
                          _pricetextEditingController,
                          "Enter Product Price",
                          5,
                          TextInputType.number,
                        )),
                  ],
                ),
              ),
              SizedBox(
                width: size.height * .01,
              ),
              Expanded(
                child: Column(
                  children: [
                    HeadingsWidet(
                        h1: "", h2: "Disconts ", alignment: Alignment.topLeft),
                    SizedBox(
                      height: size.height * .03,
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: size.height * .03,
                        ),
                        child: _textFeild(
                          _discounttextEditingController,
                          "Enter Discount ",
                          5,
                          TextInputType.number,
                        )),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * .01,
          ),
          Column(
            children: [
              HeadingsWidet(
                  h1: "", h2: "Shipping Cost", alignment: Alignment.topLeft),
              SizedBox(
                height: size.height * .03,
              ),
              SizedBox(
                height: size.height * .01,
              ),
              Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(
                    horizontal: size.height * .03,
                  ),
                  child: _textFeild(
                    _shippingCostEditingController,
                    "Enter Shipping Cost",
                    5,
                    TextInputType.number,
                  )),
            ],
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: size.height * .01),
            child: ElevatedButtonWidget(
                bgColor: Colors.orangeAccent,
                buttonSize: null,
                function: () {
                  if (_shippingCostEditingController.text.isEmpty &&
                      _discounttextEditingController.text.isEmpty &&
                      _pricetextEditingController.text.isEmpty) {
                    showMySnackBar(
                        context, "All Feilds are Reuired can not be empty");
                  } else {
                    _toNextPage();
                  }
                },
                buttonText: "Proceed"),
          ),
        ],
      ),
    );
  }

  void showMySnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.white,
        content: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Colors.red),
        ),
        action: SnackBarAction(
          label: 'Error',
          onPressed: () {
            // Perform undo action (optional)
          },
        ),
        duration: const Duration(
            seconds:
                3), // Duration for which the SnackBar is visible (optional)
      ),
    );
  }

  void _toNextPage() {
    _pageController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  Widget _thumbNail(BuildContext context, Size size) {
    return SizedBox(
      height: size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: size.height * .1),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * .1,
                ),
                HeadingsWidet(
                    h1: "Enrter the product Thumbnail",
                    h2: "images should be 512x512 with max resolutions",
                    alignment: Alignment.center),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              getFromGallery();
            },
            child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 100.0,
                backgroundImage: image != null
                    ? FileImage(File(image!.path))
                    : const NetworkImage(
                            "https://tse1.mm.bing.net/th?id=OIP.tfaSK3pwhLrecMjEcbcA9gHaHa&pid=Api&P=0&h=220")
                        as ImageProvider),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: size.height * .01),
            child: ElevatedButtonWidget(
                bgColor: Colors.orangeAccent,
                buttonSize: null,
                function: () {
                  if (image != null) {
                    _toNextPage();
                  } else {
                    showMySnackBar(
                        context, "Please provide thumbnail image image");
                  }
                },
                buttonText: "Proceed"),
          ),
        ],
      ),
    );
  }

  Widget _category(BuildContext context, Size size) {
    return SizedBox(
      height: size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: size.height * .1),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * .1,
                ),
                HeadingsWidet(
                    h1: "Choose Product Categoreis",
                    h2: "You Can Choose From Multiple Categories Of the products to choose from the list",
                    alignment: Alignment.center),
              ],
            ),
          ),
          MultiSelectDropDown(
            suffixIcon: Icon(
              Icons.arrow_downward,
              color: AppColors.bgDarkTheme,
            ),
            optionsBackgroundColor: AppColors.bgVariantDarkTheme,
            singleSelectItemStyle: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.black),
            hint: 'Select Categories',
            fieldBackgroundColor: AppColors.bgDarkTheme,
            controller: _categoriestextEditingController,
            onOptionSelected: (List<ValueItem> selectedOptions) {},
            options: const <ValueItem>[
              ValueItem(label: 'Books and Arts', value: 'Books And Arts'),
              ValueItem(label: 'Home and Kitchen', value: 'Home and Kitchen'),
              ValueItem(label: 'Electronics', value: 'Electronics'),
              ValueItem(label: 'Others', value: 'Others'),
              ValueItem(label: 'Books', value: 'Books'),
              ValueItem(label: 'Arts', value: 'Arts'),
            ],
            selectionType: SelectionType.multi,
            chipConfig: const ChipConfig(wrapType: WrapType.wrap),
            dropdownHeight: 300,
            optionTextStyle: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            selectedOptionIcon: Icon(
              Icons.check_circle,
              color: AppColors.iconsDarkTheme,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: size.height * .01),
            child: ElevatedButtonWidget(
                bgColor: Colors.orangeAccent,
                buttonSize: null,
                function: () {
                  if (_categoriestextEditingController
                      .selectedOptions.isNotEmpty) {
                    _toNextPage();
                  } else {
                    showMySnackBar(context, "Please provide Categrioes");
                  }
                },
                buttonText: "Proceed"),
          ),
        ],
      ),
    );
  }

  Widget _condition(BuildContext context, Size size) {
    return SizedBox(
      height: size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: size.height * .1),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * .1,
                ),
                HeadingsWidet(
                    h1: "Choose Product Conditons",
                    h2: "You Can Set Second hand or new products conditon with variation availaible",
                    alignment: Alignment.center),
              ],
            ),
          ),
          MultiSelectDropDown(
            suffixIcon: Icon(
              Icons.arrow_downward,
              color: AppColors.bgDarkTheme,
            ),
            optionsBackgroundColor: AppColors.bgVariantDarkTheme,
            singleSelectItemStyle: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.black),
            hint: 'Select Condtions ',
            fieldBackgroundColor: AppColors.bgDarkTheme,
            controller: _condtiontxtEditingController,
            onOptionSelected: (List<ValueItem> selectedOptions) {},
            options: const <ValueItem>[
              ValueItem(label: 'New', value: 'New'),
              ValueItem(label: 'Old', value: 'Old'),
            ],
            selectionType: SelectionType.multi,
            chipConfig: const ChipConfig(wrapType: WrapType.wrap),
            dropdownHeight: 300,
            optionTextStyle: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            selectedOptionIcon: Icon(
              Icons.check_circle,
              color: AppColors.iconsDarkTheme,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: size.height * .01),
            child: ElevatedButtonWidget(
                bgColor: Colors.orangeAccent,
                buttonSize: null,
                function: () {
                  if (_condtiontxtEditingController
                      .selectedOptions.isNotEmpty) {
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const ProductDetailsScreen()),
                    // );
                  } else {
                    showMySnackBar(context, "Please provide Categrioes");
                  }
                },
                buttonText: "Preview"),
          ),
        ],
      ),
    );
  }

  Widget _variations(BuildContext context, Size size) {
    return SizedBox(
      height: size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: size.height * .1),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * .1,
                ),
                HeadingsWidet(
                    h1: "Choose Product Categoreis",
                    h2: "You Can Choose From Multiple Categories Of the products to choose from the list",
                    alignment: Alignment.center),
              ],
            ),
          ),
          MultiSelectDropDown(
            suffixIcon: Icon(
              Icons.arrow_downward,
              color: AppColors.bgDarkTheme,
            ),
            optionsBackgroundColor: AppColors.bgVariantDarkTheme,
            singleSelectItemStyle: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.black),
            hint: 'Select Color Variation',
            fieldBackgroundColor: AppColors.bgDarkTheme,
            controller: _colortxtEditingController,
            onOptionSelected: (List<ValueItem> selectedOptions) {},
            options: const <ValueItem>[
              ValueItem(label: 'Red', value: 'Red'),
              ValueItem(label: 'Yellow', value: 'Yellow'),
              ValueItem(label: 'Grey', value: 'Grey'),
              ValueItem(label: 'White', value: 'White'),
            ],
            selectionType: SelectionType.multi,
            chipConfig: const ChipConfig(wrapType: WrapType.wrap),
            dropdownHeight: 300,
            optionTextStyle: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            selectedOptionIcon: Icon(
              Icons.check_circle,
              color: AppColors.iconsDarkTheme,
            ),
          ),
          SizedBox(
            height: size.height * .07,
          ),
          MultiSelectDropDown(
            suffixIcon: Icon(
              Icons.arrow_downward,
              color: AppColors.bgDarkTheme,
            ),
            optionsBackgroundColor: AppColors.bgVariantDarkTheme,
            singleSelectItemStyle: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.black),
            hint: 'Select Size Variations',
            fieldBackgroundColor: AppColors.bgDarkTheme,
            controller: _sizetxtEditingController,
            onOptionSelected: (List<ValueItem> selectedOptions) {},
            options: const <ValueItem>[
              ValueItem(label: 'XXL', value: 'XXL'),
              ValueItem(label: 'XL', value: 'XL'),
              ValueItem(label: 'Medium', value: 'Meduim'),
            ],
            selectionType: SelectionType.multi,
            chipConfig: const ChipConfig(wrapType: WrapType.wrap),
            dropdownHeight: 300,
            optionTextStyle: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            selectedOptionIcon: Icon(
              Icons.check_circle,
              color: AppColors.iconsDarkTheme,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: size.height * .01),
            child: ElevatedButtonWidget(
                bgColor: Colors.orangeAccent,
                buttonSize: null,
                function: () {
                  if (_colortxtEditingController.selectedOptions.isNotEmpty &&
                      _sizetxtEditingController.selectedOptions.isNotEmpty) {
                    _toNextPage();
                  } else {
                    showMySnackBar(context, "Please provide Categrioes");
                  }
                },
                buttonText: "Proceed"),
          ),
        ],
      ),
    );
  }

  getFromGallery() async {
    try {
      XFile? pickedFile = await ImagePicker().pickImage(
        imageQuality: 10,
        source: ImageSource.gallery,
        maxWidth: 512,
        maxHeight: 512,
      );
      if (pickedFile != null) {
        setState(() {
          image = File(pickedFile.path);
        });
      }
      // ignore: empty_catches
    } catch (e) {}
  }
}
