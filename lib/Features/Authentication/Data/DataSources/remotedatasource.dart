import 'dart:convert';

import 'package:flutter_application_ebay_ecom/AppCores/ConstStrings/ApisStrings/apiurls.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Data/Models/Regsiter/register_model.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Domain/Entitites/Register/register_entity.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthRemoteDataSource {
  Future<void> logIn(String email, String password);
    String getTokken();
    Future<void> forgotPassword(String email);
    Future<void> register(RegisterEntity registerEntity);
    Future<void> updatePassword(String currentPassword,String newpassword);


  
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final SharedPreferences prefs;
  final http.Client httpClient;
  AuthRemoteDataSourceImpl({required this.httpClient, required this.prefs});

  @override
  Future<void> logIn(String email, String password) async {
    String tokken = '';
     String loginUrl = '${ApiUrls.baseUrl}/api/login?email=$email&password=$password';

    

    try {
      final response = await http.post(
        Uri.parse(loginUrl),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        tokken = responseData['data']['token'];
        await prefs.setString('token', tokken);
      } else {
        throw Exception("Error Occured");
      }
    } catch (e) {
      throw Exception("Error occured");
    }
  }
  
  @override
  String getTokken() {
    String tokken = '';

    
    try {
       prefs.getString('token');
     if( prefs.getString('token')!=null){
      tokken=prefs.getString('token') as String;
       }

       

       return tokken;
     
    } catch (e) {
      throw Exception("Error occured");
    }
  }
  
  @override
Future<void> forgotPassword(String email) async {
  String forgotPasswordUrl = '${ApiUrls.baseUrl}/api/forget-password?email=$email';
 

     

  try {


    final response = await http.post(
      Uri.parse(forgotPasswordUrl),
      headers: {
          'Content-Type': 'application/json',
        },
      
    );
    
    print(response.statusCode);
    if (response.statusCode == 200) {
      // Success response
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      String token = responseData['token'];
      
      await prefs.setString('password_reset_token', token);

    } 
    else if(response.statusCode==422){

  throw "Email not found";

    }
    
    else {
      throw "An unexpected error occurred}";
    }
  // ignore: empty_catches
  } catch (e) {
    rethrow;

  }
}

  
@override
Future<void> register(RegisterEntity registerEntity) async {
  String token = '';
  String registerUrl = '${ApiUrls.baseUrl}/api/register';

  var registerModel = RegisterModel(
    name: registerEntity.name,
    email: registerEntity.email,
    mobileNo: registerEntity.mobileNo,
    password: registerEntity.password,
    confirmPassword: registerEntity.password,
  ).toJson();

  try {
    final response = await http.post(
      Uri.parse(registerUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(registerModel),
    );


    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      token = responseData['data']['token'];
      await prefs.setString('token', token);
    } else if (response.statusCode == 422) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      String emailError = '';
      String mobileError = '';

      // Extract errors for email and mobile_no specifically
      if (responseData['error'] != null) {
        // Check for specific 'already been taken' errors
        if (responseData['error']['email'] != null && responseData['error']['email'][0].contains('already been taken')) {
          emailError = responseData['error']['email'][0];
        }
        if (responseData['error']['mobile_no'] != null && responseData['error']['mobile_no'][0].contains('already been taken')) {
          mobileError = responseData['error']['mobile_no'][0];
        }
      }

      // Combine errors with "and" if both exist
      String formattedErrors = '';
      if (emailError.isNotEmpty && mobileError.isNotEmpty) {
        formattedErrors = '$emailError and $mobileError';
      } else if (emailError.isNotEmpty) {
        formattedErrors = emailError;
      } else if (mobileError.isNotEmpty) {
        formattedErrors = mobileError;
      }

      // If there are any formatted errors, throw them as a string (not an Exception)
      if (formattedErrors.isNotEmpty) {
        throw formattedErrors; // Throw as string
      } else {

        throw "An unexpected validation error occurred.";
      }
    } else {
      throw "An unexpected error occurred. Status code: ${response.statusCode}";
    }
  } catch (e) {
    // No longer wrapping the error in an Exception, just rethrowing the message
    rethrow;
  }
}

 @override
Future<void> updatePassword(String currentPassword, String newPassword) async {
  String forgotPasswordUrl = '${ApiUrls.baseUrl}/api/change-password';
  var forgotPasswordModel = {
    'current_password': currentPassword,
    'new_password': newPassword,
  };

  try {
    final String? token = prefs.getString('token');

    final response = await http.post(
      Uri.parse(forgotPasswordUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(forgotPasswordModel),
    );

    
    if (response.statusCode == 200) {
      // Password updated successfully
      return;
    } 
    else if (response.statusCode == 202) {
      // Handle case when the current password is incorrect
      throw "Current password is incorrect"; // Treat as an error
    } 
    else {
      // Handle unexpected errors
      throw "An unexpected error occurred. Status code: ${response.statusCode}";
    }
  } catch (e) {
    // Handle the error
    rethrow; // Optionally propagate the error
  }
}

}

  

