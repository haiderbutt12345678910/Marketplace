import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({required this.error, required this.statusCode});

  final String error;
  final String statusCode;

  @override
  List<Object?> get props => [error, statusCode];
}

class ApiFailure extends Failure {
  const ApiFailure({required super.error, required super.statusCode});
}
