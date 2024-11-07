import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/appelevatedbuttons.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/pageheadings.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/CoreWidgets/businessappbarwidet.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

class IdentityVerificationScreen extends StatefulWidget {
  const IdentityVerificationScreen({super.key});

  @override
  _IdentityVerificationScreenState createState() =>
      _IdentityVerificationScreenState();
}

class _IdentityVerificationScreenState
    extends State<IdentityVerificationScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _avatarImage;
  XFile? _cnicBackImage;
  XFile? _cnicFrontImage;
  DateTime? _selectedDOB;

  // Function to pick an image from the gallery
  Future<void> _pickImage(ImageType type) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        if (type == ImageType.Avatar) {
          _avatarImage = image;
        } else if (type == ImageType.CNICBack) {
          _cnicBackImage = image;
        } else if (type == ImageType.CNICFront) {
          _cnicFrontImage = image;
        }
      });
    }
  }

  // Function to show the date picker
  Future<void> _selectDOB(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900, 1),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDOB) {
      setState(() {
        _selectedDOB = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
       appBar: PreferredSize(
          preferredSize: Size(double.infinity, size.height*.1),
          child:const BusinessAppBarWidget(),
        ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HeadingsWidet(h1: "Identity verification", alignment: Alignment.center,h2: 'Provide below details to get verified',),
            SizedBox(height: size.height*.02,),
            GestureDetector(
              onTap: () => _pickImage(ImageType.Avatar),
              child: CircleAvatar(
                radius: 70,
                backgroundColor: Colors.grey[300],
                backgroundImage: _avatarImage != null
                    ? FileImage(_avatarImage as dynamic)
                    : null,
                child: _avatarImage == null
                    ?const Icon(Icons.person, size: 70, color: Colors.grey)
                    : null,
              ),
            ),
            
          const  SizedBox(height: 4),
           Container(alignment: Alignment.center,
           child: Text("Profile Image",style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.grey,fontWeight: FontWeight.w700),),),
            // Update Profile button
           
          const  SizedBox(height: 10),

            // Date of Birth picker
            GestureDetector(
              onTap: () => _selectDOB(context),
              child: Container(
                padding:const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _selectedDOB != null
                          ? DateFormat('dd/MM/yyyy').format(_selectedDOB!)
                          : 'Select Date of Birth',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.calendar_today, color: Colors.grey[600]),
                  ],
                ),
              ),
            ),
          const  SizedBox(height: 32),

            // Two square containers for CNIC Back and CNIC Front
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // CNIC Back container
                GestureDetector(
                  onTap: () => _pickImage(ImageType.CNICBack),
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: _cnicBackImage != null
                        ? Image.file(
                            _cnicBackImage as dynamic,
                            fit: BoxFit.cover,
                          )
                        : Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                             const   Icon(Icons.camera_alt,
                                    size: 40, color: Colors.grey),
                           const    SizedBox(height: 8),
                                Text(
                                  'CNIC Back',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ),
                ),

                // CNIC Front container
                GestureDetector(
                  onTap: () => _pickImage(ImageType.CNICFront),
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: _cnicFrontImage != null
                        ? Image.file(
                            _cnicFrontImage as dynamic,
                            fit: BoxFit.cover,
                          )
                        : Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                             const   Icon(Icons.camera_alt,
                                    size: 40, color: Colors.grey),
                             const   SizedBox(height: 8),
                                Text(
                                  'CNIC Front',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ),
                ),
              ],
            ),
           const SizedBox(height: 50,),
            ElevatedButtonWidget(buttonSize: null, function: (){
            
            }, buttonText: "submit")
          ],
        ),
      ),
    );
  }
  void submit(BuildContext content ){
  


    
  }
}

// ignore: constant_identifier_names
enum ImageType { Avatar, CNICBack, CNICFront }
