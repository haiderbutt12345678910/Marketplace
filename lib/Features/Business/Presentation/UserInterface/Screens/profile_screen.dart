import 'dart:io';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/BlocStates/blocstates.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ConstStrings/ApisStrings/apiurls.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/appelevatedbuttons.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/apptextformfeild.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/circularprogess.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/pageheadings.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/snackbarcutom.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ScreenSizeUtils/screensize.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/getcities_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/getuser_bloc.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/CoreWidgets/businessappbarwidet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Domain/Entities/user_entity.dart';
import '../../StateMangement/Blocs/updateuser_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _shippingAddressController;
  late TextEditingController _mobileNumberController;
  late TextEditingController _personalAddressController;
  late TextEditingController _dateOfBirthController;
  late TextEditingController _emailController;
  String _imgUrl='';
  File? _profileImage;
  String? _selectedCity;

  final List<String> _cities = [
    // Add more cities as needed
  ];

  @override
  void initState() {
    super.initState();
    var cities = BlocProvider.of<GetcitiesBloc>(context).getCitiesLocal();
    _cities.addAll(cities.map((city) => city.cityName).toList());

    var userEntity = BlocProvider.of<GetUserBloc>(context).getUserLocal();
    _selectedCity = userEntity.cityName;

    _imgUrl='${ApiUrls.baseUrl}/${userEntity.profileImage}';
    
    _nameController = TextEditingController(text: userEntity.name);
    _shippingAddressController =
        TextEditingController(text: userEntity.shippingAddress);
    _mobileNumberController = TextEditingController(text: userEntity.mobileNo);
    _personalAddressController =
        TextEditingController(text: userEntity.personalAddress);
    _dateOfBirthController = TextEditingController(text: userEntity.cityName);
    _selectedCity = userEntity.cityName;
    _emailController = TextEditingController(text: userEntity.email);
  }


  @override
  void dispose() {
    _nameController.dispose();
    _shippingAddressController.dispose();
    _mobileNumberController.dispose();
    _personalAddressController.dispose();
    _dateOfBirthController.dispose();
    super.dispose();
  }

 Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  // String? _imageToBase64(File? image) {
  //   if (image == null) return null;
  //   final bytes = image.readAsBytesSync();
  //   return base64Encode(bytes);
  // }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _dateOfBirthController.text = picked.toLocal().toString().split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = ScreenSizeUtil.getScreenSized(context);
    return Scaffold(
      appBar:PreferredSize(
          preferredSize: Size(double.infinity, size.height*.1),
          child:const BusinessAppBarWidget(),
        ),
      body: BlocConsumer<UpdateuserBloc,BlocStates>(builder: (ctx,state){
         return Stack(
                children: [

                  SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: size.height * .05),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                HeadingsWidet(
                  h1: "Build Your Profile",
                  alignment: Alignment.center,
                  h2: "This information will let us know more about you",
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () => _pickImage(),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: _profileImage != null
                        ? FileImage(_profileImage!)
                        :  NetworkImage(
                                _imgUrl)
                            as ImageProvider,
                    child: _profileImage == null
                        ? const Icon(Icons.add_a_photo, size: 50)
                        : null,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                _infoWidet(context, size),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
                  if (state is Loading) const ProgressCircularIndicatorCustom()
                ],
              );

      }, listener: (ctx,state){

 if (state is Sucessfull) {
               
               
                CustomSnackbar.show(
                iconData: Icons.check_circle_outline,
                
              buildContext: context, errorheading: " Success!", error: "User Was Updated Successfully ", iconColor: Colors.green);
                

               
                
               
            

              
              } else if (state is Failure) {

              CustomSnackbar.show(
                iconData: Icons.error,
                
              buildContext: context, errorheading: "Failure!", error: "Something went wrong try again", iconColor: Colors.red);
                
              } else {





              }

      }),
    );
  }



  Widget _selcetCities(BuildContext context, Size size) {
    var citiesList = BlocProvider.of<GetcitiesBloc>(context).getCitiesLocal();
    List<String> list = [];
    for (int i = 0; i < citiesList.length; i++) {
      list.add(citiesList[i].cityName);
    }

    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: size.height * .01,
        vertical: size.height * .04,
      ),
      child: CustomDropdown<String>(
        hintText: 'Select Cities',
        items: list,
        decoration: CustomDropdownDecoration(
          closedBorder: const Border(
              top: BorderSide(color: Colors.black, width: 1.0),
              left: BorderSide(color: Colors.black, width: 1.0),
              bottom: BorderSide(color: Colors.black, width: 1.0),
              right: BorderSide(color: Colors.black, width: 1.0)),
          expandedBorder: const Border(
              top: BorderSide(color: Colors.black, width: 1.0),
              left: BorderSide(color: Colors.black, width: 1.0),
              bottom: BorderSide(color: Colors.black, width: 1.0),
              right: BorderSide(color: Colors.black, width: 1.0)),
          closedBorderRadius: BorderRadius.zero,
          expandedBorderRadius: BorderRadius.zero,
          hintStyle: Theme.of(context).textTheme.titleLarge,
        ),
        onChanged: (value) {
          // Handle dropdown value change
        },
      ),
    );
  }

  Widget _infoWidet(BuildContext context, Size size) {
    EdgeInsets textFormFeildSize = EdgeInsets.symmetric(
      horizontal: size.height * .01,
      vertical: size.height * .005,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                margin: textFormFeildSize,
                child: TextFormFeildWidget(
                  idForFeild: "name",
                  textEditingController: _nameController,
                ),
              ),
            ),
            SizedBox(
              width: size.width * .01,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                margin: textFormFeildSize,
                child: TextFormFeildWidget(
                  idForFeild: "phone",
                  textEditingController: _mobileNumberController,
                ),
              ),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          margin: textFormFeildSize,
          child: TextFormFeildWidget(
            idForFeild: "e",
            textEditingController: _emailController,
          ),
        ),
      //  _selcetCities(context, size),
        Container(
          width: double.infinity,
          margin: textFormFeildSize,
          child: TextFormFeildWidget(
            idForFeild: "adress",
            textEditingController: _shippingAddressController,
          ),
        ),
        Container(
          width: double.infinity,
          margin: textFormFeildSize,
          child: TextFormFeildWidget(
            idForFeild: "padress",
            textEditingController: _personalAddressController,
          ),
        ),
        SizedBox(
          height: size.height * .01,
        ),
        ElevatedButtonWidget(
          buttonSize: null,
          function: () {
            submit(context);
          },
          buttonText: "Update",
        ),
      ],
    );
  }

  void submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
     
      UserUpdateEntity userEntity = UserUpdateEntity(
           
          cityName: "Islambad" ,
          name: _nameController.text,
          shippingAddress: _shippingAddressController.text,
          profileImagePath: _profileImage?.path,
          permanentAddress: "pwd pakistam town phae1"
          
          
          
          
          );

      BlocProvider.of<UpdateuserBloc>(context).updateUser(userEntity);
    }
  }
}
