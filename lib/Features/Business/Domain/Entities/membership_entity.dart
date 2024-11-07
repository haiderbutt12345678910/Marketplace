import 'package:equatable/equatable.dart';

class MembershipEntity extends Equatable {
  final int id;
  final String title;
  final String allowProductsPerMonth;
  final String saleCommission;
  final String tax;
  final String transactionCharges;
  final String otherCharges;
  final String imagesAllow;
  final String allowProductVideo;
  final String withdrawDuration;
  final String publicationStatus;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;

  const MembershipEntity({
    required this.id,
    required this.title,
    required this.allowProductsPerMonth,
    required this.saleCommission,
    required this.tax,
    required this.transactionCharges,
    required this.otherCharges,
    required this.imagesAllow,
    required this.allowProductVideo,
    required this.withdrawDuration,
    required this.publicationStatus,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  @override
  List<Object?> get props => [
        id,
      ];
}
