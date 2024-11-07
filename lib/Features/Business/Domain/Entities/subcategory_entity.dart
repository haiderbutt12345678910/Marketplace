import 'package:equatable/equatable.dart';

class SubCategoryEntity extends Equatable {
  final String id;
  final String categoryId;
  final String subCategoryName;

  const SubCategoryEntity({
    required this.id,
    required this.categoryId,
    required this.subCategoryName,
  });

  @override
  List<Object?> get props => [
        id,
      ];
}
