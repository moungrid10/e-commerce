import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel{
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productCount;

  BrandModel({required this.id,required this.image,required this.name, this.isFeatured, this.productCount});

  static BrandModel empty() => BrandModel(id: '', image: '', name: '');


  toJson(){
    return{
      'Id': id,
      'Name': name,
      'Image': image,
      'ProductCount': productCount,
      'IsFeatured': isFeatured,

    };
  }

  factory BrandModel.fromJson(Map<String, dynamic> document){
    final data = document;
    if (data.isEmpty) return BrandModel.empty();
    return BrandModel(
    id: data['Id']?? '', 
    image: data['Image']?? '', 
    name: data['Name']?? '',
    isFeatured: data['IsFeatured'] ?? false,
    productCount: int.parse((data['ProductCount'] ?? 0).toString()),
    );
  }
  factory BrandModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    if(document.data() != null){
      final data = document.data()!;

      return BrandModel(
        id: document.id, 
        image: data['Image'] ?? '', 
        name: data['Name'] ?? '',
        productCount: data['ProductCount'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
        );

    } else {
      return BrandModel.empty();
    }
  }

  // factory BrandModel.fromQuerySnapshot(DocumentSnapshot<Map<String, dynamic>> document){
  //   if (document.data() != null){
  //     final data = document.data()!;

  //     return BrandModel(
  //       id: id, 
  //       image: image, 
  //       name: name)
  //   }
  // }
}