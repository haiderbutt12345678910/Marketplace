import 'package:equatable/equatable.dart';

class SliderEntity extends Equatable {
   final String? id;
   final String image;

   const SliderEntity({
    required this.id,
    required this.image
  });

  @override
  List<Object?> get props => [
    id
   
  ];
}
