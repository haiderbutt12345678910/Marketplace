import 'package:flutter_application_ebay_ecom/Features/Authentication/Domain/Entitites/Register/register_entity.dart';

class RegisterModel extends RegisterEntity {
  const RegisterModel({
    required super.name,
    required super.email,
    required super.mobileNo,
    required super.password,
    required super.confirmPassword,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      name: json['name'],
      email: json['email'],
      mobileNo: json['mobile_no'],
      password: json['password'],
      confirmPassword: json['c_password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'mobile_no': mobileNo,
      'password': password,
      'c_password': confirmPassword,
    };
  }
}
