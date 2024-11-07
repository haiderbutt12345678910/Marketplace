import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String? id;
  final String? categoryName;
  final String? thumbnail;

  const CategoryEntity({
    this.id,
    this.categoryName,
    this.thumbnail,
  });

  @override
  List<Object?> get props => [
        id,
      ];
}
