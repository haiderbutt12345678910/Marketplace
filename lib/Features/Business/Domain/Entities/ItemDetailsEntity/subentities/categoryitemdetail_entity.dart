import 'package:equatable/equatable.dart';

class CategoryEntityItemDetail extends Equatable {
  final String? id;
  final String? categoryName;
  final String? publicationStatus;

  const CategoryEntityItemDetail({
    this.id,
    this.categoryName,
    this.publicationStatus,
  });

  @override
  List<Object?> get props => [
        id,
      ];
}
