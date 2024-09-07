import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/Exceptions/custom_exceptions.dart';
import 'package:e_commerce/data/services/firebase_storage_services.dart';
import 'package:e_commerce/features/shop/models/banner_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<BannerModel>> fetchBanners () async {
    try {
      final result = await _db.collection('Banners').where('active', isEqualTo:true).get();
      return result.docs.map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot)).toList();
      
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.message ?? 'Unknown Firebase error');
    } on PlatformException catch (e) {
      throw TPlatformException(e.message ?? 'Unknown Platform error');
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }
  Future<void> uploadBanners(List<BannerModel> banners) async { 
  try {
    final storage = Get.put(FirebaseStorageService());
    for (final banner in banners) {
      
      final imageData = await storage.getImageDataFromAssets(banner.imageUrl);
      final imageUrl = await storage.uploadImagedata('Banners/Images', imageData, banner.imageUrl);
      banner.imageUrl = imageUrl;

      // Assign ID starting from 1
      

      // Store banner in Firestore
      await _db.collection("Banners").doc().set(banner.toJson());
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