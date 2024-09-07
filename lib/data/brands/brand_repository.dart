import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/Exceptions/custom_exceptions.dart';
import 'package:e_commerce/features/shop/models/brand_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();


  final _db = FirebaseFirestore.instance;



  
Future<List<BrandModel>> getAllBrands() async {

try {
final snapshot = await _db.collection ('Brands').get();
return snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
} on FirebaseException catch (e) {
throw TFirebaseException(e.code).message;
} on PlatformException catch (e) {
throw TPlatformException(e.code).message;
} catch (e) {
  throw 'Something went wrong. Please try again';
}}



Future<List<BrandModel>> getBrandsForCategory(String categoryId)async {

try {
QuerySnapshot brandCategoryQuery = await _db.collection("BrandCategory").where('categoryId', isEqualTo: categoryId).get();
List<String> brandIds = brandCategoryQuery.docs.map((doc) => doc['brandId'] as String).toList();
final brandQuery = await _db.collection ('Brands').where(FieldPath.documentId, whereIn: brandIds).limit(2).get();
 List<BrandModel> brands = brandQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();

 return brands;
} on FirebaseException catch (e) {
throw TFirebaseException(e.code).message;
} on PlatformException catch (e) {
throw TPlatformException(e.code).message;
} catch (e) {
  throw 'Something went wrong. Please try again';
}}
 
}