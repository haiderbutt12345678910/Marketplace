import '../../../Domain/Entities/user_entity.dart';

class UserModel extends UserEntity {
  // ignore: use_super_parameters
  const UserModel({
    required super.id,
    super.googleId,
    required super.membershipId,
    required super.storeSlug,
    required super.name,
    required super.email,
    super.emailVerifiedAt,
    required super.mobileNo,
    super.mobileNoVerifiedAt,
    required super.profileImage,
    super.cityName,
    super.shippingAddress,
    super.personalAddress,
    super.cnicFrontCopy,
    super.cnicBackCopy,
    super.dateOfBirth,
    super.identityVerifiedAt,
    String? identityVerificationStatus, // Nullable now
    required super.publicationStatus,
    required super.createdFrom,
    required super.createdAt,
    required super.updatedAt,
    super.deletedAt,
  }) : super(
          identityVerificationStatus: identityVerificationStatus,
        );

  // Factory method to create a UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      googleId: json['google_id'] as String?,
      membershipId: json['membership_id'] as String,
      storeSlug: json['store_slug'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      emailVerifiedAt: json['email_verified_at'] as String?,
      mobileNo: json['mobile_no'] as String,
      mobileNoVerifiedAt: json['mobile_no_verified_at'] as String?,
      profileImage: json['profile_image'] as String,
      cityName: json['city_name'] as String?,
      shippingAddress: json['shipping_address'] as String?,
      personalAddress: json['personal_address'] as String?,
      cnicFrontCopy: json['cnic_front_copy'] as String?,
      cnicBackCopy: json['cnic_back_copy'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      identityVerifiedAt: json['identity_verified_at'] as String?,
      identityVerificationStatus: json['identity_verification_status'] as String?, // Nullable now
      publicationStatus: json['publication_status'] as String,
      createdFrom: json['created_from'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      deletedAt: json['deleted_at'] as String?,
    );
  }

  // Method to convert a UserModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'google_id': googleId,
      'membership_id': membershipId,
      'store_slug': storeSlug,
      'name': name,
      'email': email,
      'email_verified_at': emailVerifiedAt,
      'mobile_no': mobileNo,
      'mobile_no_verified_at': mobileNoVerifiedAt,
      'profile_image': profileImage,
      'city_name': cityName,
      'shipping_address': shippingAddress,
      'personal_address': personalAddress,
      'cnic_front_copy': cnicFrontCopy,
      'cnic_back_copy': cnicBackCopy,
      'date_of_birth': dateOfBirth,
      'identity_verified_at': identityVerifiedAt,
      'identity_verification_status': identityVerificationStatus,
      'publication_status': publicationStatus,
      'created_from': createdFrom,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
    };
  }
}



class UserUpdateModel extends UserUpdateEntity {
  const UserUpdateModel({
    required super.name,
    super.cityName,
    super.shippingAddress,
    super.permanentAddress,
    super.profileImagePath,
  });

  factory UserUpdateModel.fromJson(Map<String, dynamic> json) {
    return UserUpdateModel(
      name: json['name'],
      cityName: json['city_name'],
      shippingAddress: json['shipping_address'],
      permanentAddress: json['permanent_address'],
      profileImagePath: json['profile_image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'city_name': cityName,
      'shipping_address': shippingAddress,
      'permanent_address': permanentAddress,
      'profile_image': profileImagePath, // For binary, we will handle in updateUser method
    };
  }
}

