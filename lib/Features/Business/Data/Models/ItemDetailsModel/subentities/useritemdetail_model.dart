import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/ItemDetailsEntity/subentities/userentityitemdetail_entity.dart';

class UserModelItemDetail extends UserEntityItemDetail {
  const UserModelItemDetail({
    super.id,
    super.name,
    super.profileImage,
    super.storeSlug,
    super.emailVerifiedAt,
    super.cityName,
    super.identityVerifiedAt,
  });

  factory UserModelItemDetail.fromJson(Map<String, dynamic> json) {
    return UserModelItemDetail(
      id: json['id'],
      name: json['name'],
      profileImage: json['profile_image'],
      storeSlug: json['store_slug'],
      emailVerifiedAt: json['email_verified_at'] != null
          ? DateTime.tryParse(json['email_verified_at'])
          : null,
      cityName: json['city_name'],
      identityVerifiedAt: json['identity_verified_at'] != null
          ? DateTime.tryParse(json['identity_verified_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'profile_image': profileImage,
      'store_slug': storeSlug,
      'email_verified_at': emailVerifiedAt?.toIso8601String(),
      'city_name': cityName,
      'identity_verified_at': identityVerifiedAt?.toIso8601String(),
    };
  }
}
