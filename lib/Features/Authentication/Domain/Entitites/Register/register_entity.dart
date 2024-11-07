import 'package:equatable/equatable.dart';

class RegisterEntity extends Equatable {
  final String name;
  final String email;
  final String mobileNo;
  final String password;
  final String confirmPassword;

  const RegisterEntity({
    required this.name,
    required this.email,
    required this.mobileNo,
    required this.password,
    required this.confirmPassword,
  });

  @override
  List<Object?> get props => [email]; // Assuming email is the unique identifier
}
