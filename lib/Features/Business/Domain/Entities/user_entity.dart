
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable{
  final String id;
  final String? googleId;
  final String membershipId;
  final String storeSlug;
  final String name;
  final String email;
  final String? emailVerifiedAt;
  final String mobileNo;
  final String? mobileNoVerifiedAt;
  final String profileImage;
  final String? cityName;
  final String? shippingAddress;
  final String? personalAddress;
  final String? cnicFrontCopy;
  final String? cnicBackCopy;
  final String? dateOfBirth;
  final String? identityVerifiedAt;
  final String? identityVerificationStatus;
  final String publicationStatus;
  final String createdFrom;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;

  const UserEntity({
    required this.id,
    this.googleId,
    required this.membershipId,
    required this.storeSlug,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.mobileNo,
    this.mobileNoVerifiedAt,
    required this.profileImage,
    this.cityName,
    this.shippingAddress,
    this.personalAddress,
    this.cnicFrontCopy,
    this.cnicBackCopy,
    this.dateOfBirth,
    this.identityVerifiedAt,
    required this.identityVerificationStatus,
    required this.publicationStatus,
    required this.createdFrom,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });
  @override
  List<Object?> get props => [
        id,
      ];
}





class UserUpdateEntity  extends Equatable{
  final String name;
  final String? cityName;
  final String? shippingAddress;
  final String? permanentAddress;
  final String? profileImagePath;

 const UserUpdateEntity({
    required this.name,
    this.cityName,
    this.shippingAddress,
    this.permanentAddress,
    this.profileImagePath,
  });
  
  @override
  List<Object?> get props => throw UnimplementedError();
}