import '../../Domain/Entities/membership_entity.dart';

class MembershipModel extends MembershipEntity {
  const MembershipModel({
    required super.id,
    required super.title,
    required super.allowProductsPerMonth,
    required super.saleCommission,
    required super.tax,
    required super.transactionCharges,
    required super.otherCharges,
    required super.imagesAllow,
    required super.allowProductVideo,
    required super.withdrawDuration,
    required super.publicationStatus,
    required super.createdAt,
    required super.updatedAt,
    super.deletedAt,
  });

  factory MembershipModel.fromJson(Map<String, dynamic> json) {
    return MembershipModel(
      id: json['id'],
      title: json['title'],
      allowProductsPerMonth: (json['allow_products_per_month']),
      saleCommission: (json['sale_commission']),
      tax: (json['tax']),
      transactionCharges: (json['transection_charges']),
      otherCharges: (json['other_charges']),
      imagesAllow: (json['images_allow']),
      allowProductVideo: json['allow_product_video'],
      withdrawDuration: (json['withdraw_duration']),
      publicationStatus: json['publication_status'],
      createdAt: (json['created_at']),
      updatedAt: (json['updated_at']),
      deletedAt: json['deleted_at'] != null
          ? (json['deleted_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'allow_products_per_month': allowProductsPerMonth,
      'sale_commission': saleCommission,
      'tax': tax,
      'transection_charges': transactionCharges,
      'other_charges': otherCharges,
      'images_allow': imagesAllow,
      'allow_product_video': allowProductVideo,
      'withdraw_duration': withdrawDuration,
      'publication_status': publicationStatus,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
    };
  }
}
