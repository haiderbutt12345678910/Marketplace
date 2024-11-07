import 'package:flutter_application_ebay_ecom/Features/Business/Domain/Entities/Sliders/slider_entity.dart';


class SliderModel extends SliderEntity {
  const SliderModel({
    required super.id,
    required super.image,
    
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      id: json['id'],
       image:json['image'] ,
     
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
     
    };
  }
}
