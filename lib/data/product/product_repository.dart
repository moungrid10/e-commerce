import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/Exceptions/custom_exceptions.dart';
import 'package:e_commerce/data/services/firebase_storage_services.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();


  final _db = FirebaseFirestore.instance; 



Future<List<ProductModel>> getFeaturedProducts() async {

try {
final snapshot = await _db.collection ('Products').where('IsFeatured', isEqualTo: true).limit(4).get();
return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
} on FirebaseException catch (e) {
throw TFirebaseException(e.code).message;
} on PlatformException catch (e) {
throw TPlatformException(e.code).message;
} catch (e) {
  throw 'Something went wrong. Please try again';
}}




Future<List<ProductModel>> getAllFeaturedProducts() async {

try {
final snapshot = await _db.collection ('Products').where('IsFeatured', isEqualTo: true).get();
return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
} on FirebaseException catch (e) {
throw TFirebaseException(e.code).message;
} on PlatformException catch (e) {
throw TPlatformException(e.code).message;
} catch (e) {
  throw 'Something went wrong. Please try again';
}}




Future<List<ProductModel>> fetchProductsByQuery(Query query) async {

try {
final querySnapshot = await query.get();
final List<ProductModel> productList = querySnapshot.docs.map((doc) => ProductModel.fromQuerySnapshot(doc)).toList();
return productList;

} on FirebaseException catch (e) {
throw TFirebaseException(e.code).message;
} on PlatformException catch (e) {
throw TPlatformException(e.code).message;
} catch (e) {
  throw 'Something went wrong. Please try again';
}}




Future<List<ProductModel>> getFavoriteProducts(List<String> productIds) async {

try {
final snapshot = await _db.collection ('Products').where(FieldPath.documentId, whereIn: productIds).get();
return snapshot.docs.map((querySnapshot)=> ProductModel.fromSnapshot(querySnapshot)).toList();

} on FirebaseException catch (e) {
throw TFirebaseException(e.code).message;
} on PlatformException catch (e) {
throw TPlatformException(e.code).message;
} catch (e) {
  throw 'Something went wrong. Please try again';
}}






Future<List<ProductModel>> getProductsForBrand({required String brandId, int limit = -1}) async {

try {
  final querySnapshot = limit == -1 ? await _db.collection("Products").where('Brand.Id', isEqualTo: brandId).get() :
  await _db.collection("Products").where('Brand.Id', isEqualTo: brandId).limit(limit).get();

  final products = querySnapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();

  return products;
} on FirebaseException catch (e) {
throw TFirebaseException(e.code).message;
} on PlatformException catch (e) {
throw TPlatformException(e.code).message;
} catch (e) {
  throw 'Something went wrong. Please try again';
}}


Future<List<ProductModel>> getProductsForCategory({required String categoryId,int limit = 4}) async {

try {
  QuerySnapshot ProductCategoryQuery = limit == -1 ? await _db.collection("ProductCategory").where('categoryId', isEqualTo: categoryId).get() :
  await _db.collection("ProductCategory").where('categoryId', isEqualTo: categoryId).limit(limit).get();

  List<String> productIds = ProductCategoryQuery.docs.map((doc) =>doc["productId"] as String).toList();
   final productsQuery = await _db.collection('Products').where(FieldPath.documentId, whereIn: productIds).get();

   List<ProductModel> products = productsQuery.docs.map((doc)=> ProductModel.fromSnapshot(doc)).toList();

  return products;
} on FirebaseException catch (e) {
throw TFirebaseException(e.code).message;
} on PlatformException catch (e) {
throw TPlatformException(e.code).message;
} catch (e) {
  throw 'Something went wrong. Please try again';
}}


Future<void> uploadDummyData(List<ProductModel> products) async {
  try {
    final storage = Get.put(FirebaseStorageService());

    for (var product in products) {
      // Check if thumbnail is valid before uploading
      if (product.thumbnail != null && product.thumbnail!.isNotEmpty) {
        Uint8List thumbnail = await downloadImageFromNetwork(product.thumbnail!);
        final thumbnailUrl = await storage.uploadImagedata('Products/Images', thumbnail, product.thumbnail.toString());
        product.thumbnail = thumbnailUrl;
      } else {
        // Provide a placeholder thumbnail if empty
        product.thumbnail = "https://example.com/placeholder_image.png";
      }

      // Process additional images
      if (product.images != null && product.images!.isNotEmpty) {
        List<String> imagesUrl = [];
        for (var image in product.images!) {
          if (image.isNotEmpty) {
            Uint8List assetImage = await downloadImageFromNetwork(image);
            final url = await storage.uploadImagedata('Products/Images', assetImage, image);
            imagesUrl.add(url);
          }
        }
        product.images!.clear();
        product.images!.addAll(imagesUrl);
      }

      // Upload Variation Images
      if (product.productType == ProductType.variable.toString()) {
        for (var variation in product.productVariations!) {
          if (variation.image.isNotEmpty) {
            Uint8List variationImage = await downloadImageFromNetwork(variation.image);
            final url = await storage.uploadImagedata('Products/Images', variationImage, variation.image);
            variation.image = url;
          } else {
            // Provide a placeholder image for variation
            variation.image = "https://example.com/placeholder_image.png";
          }
        }
      }

      // Store product in Firestore
      await _db.collection("Products").doc(product.id).set(product.toJson());
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


// Function to download an image from a network URL
Future<Uint8List> downloadImageFromNetwork(String url) async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return response.bodyBytes;
  } else {
    throw Exception('Error downloading image: ${response.statusCode}');
  }
}



  }
