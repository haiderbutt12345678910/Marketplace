import 'package:equatable/equatable.dart';

class SubCategoryEntityItemDetail extends Equatable {
  final String? id;
  final String? subCategoryName;
  final String? publicationStatus;

  const SubCategoryEntityItemDetail({
    this.id,
    this.subCategoryName,
    this.publicationStatus,
  });

  @override
  List<Object?> get props => [
        id,
      ];
}
