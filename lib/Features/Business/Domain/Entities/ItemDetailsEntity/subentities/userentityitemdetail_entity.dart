import 'package:equatable/equatable.dart';

class UserEntityItemDetail extends Equatable {
  final String? id;
  final String? name;
  final String? profileImage;
  final String? storeSlug;
  final DateTime? emailVerifiedAt;
  final String? cityName;
  final DateTime? identityVerifiedAt;

  const UserEntityItemDetail({
    this.id,
    this.name,
    this.profileImage,
    this.storeSlug,
    this.emailVerifiedAt,
    this.cityName,
    this.identityVerifiedAt,
  });

  @override
  List<Object?> get props => [
        id,
      ];
}
