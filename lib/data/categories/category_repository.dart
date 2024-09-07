import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/Exceptions/custom_exceptions.dart';
import 'package:e_commerce/data/services/firebase_storage_services.dart';
import 'package:e_commerce/features/shop/models/categories_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();


  final _db = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getAllCategories () async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.message ?? 'Unknown Firebase error');
    } on PlatformException catch (e) {
      throw TPlatformException(e.message ?? 'Unknown Platform error');
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }


  Future<List<CategoryModel>> getSubCategories (String categoryId)async {
    try {
      final snapshot = await _db.collection('Categories').where('ParentId', isEqualTo: categoryId).get();
      final result = snapshot.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();
      return result;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.message ?? 'Unknown Firebase error');
    } on PlatformException catch (e) {
      throw TPlatformException(e.message ?? 'Unknown Platform error');
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  Future<void> uploadDummyData(List<CategoryModel> Categories) async {
    try{
      final storage = Get.put(FirebaseStorageService());

      for (var category in Categories){
        final file = await storage.getImageDataFromAssets( category.image);

        final url = await storage.uploadImagedata('Categories', file, category.name);

        category.image = url;

        await _db.collection('Categories').doc(category.id).set(category.toJson());


      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.message ?? 'Unknown Firebase error');
    } on PlatformException catch (e) {
      throw TPlatformException(e.message ?? 'Unknown Platform error');
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }
  Future<void> uploadCategories(List<CategoryModel> categories) async { 
  try {
    final storage = Get.put(FirebaseStorageService());
    for (var i = 0; i < categories.length; i++) {
      final category = categories[i];
      final imageData = await storage.getImageDataFromAssets(category.image);
      final imageUrl = await storage.uploadImagedata('Categories/Images', imageData, category.image);
      category.image = imageUrl;

      // Assign ID starting from 1
      final categoryId = (i + 1).toString();
      category.id = categoryId;

      // Store category in Firestore
      await _db.collection("Categories").doc(category.id).set(category.toJson());
    }
  } on FirebaseException catch (e) {
    throw e.message!;
  } on SocketException catch (e) {
    throw e.message;
  } on PlatformException catch (e) {
    throw e.message!;
  } catch (e) {
    throw e.toString();
  }
}

}