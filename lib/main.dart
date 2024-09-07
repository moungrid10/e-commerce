import 'package:e_commerce/app.dart';
import 'package:e_commerce/data/banners/bammer_repository.dart';
import 'package:e_commerce/data/categories/category_repository.dart';
import 'package:e_commerce/data/dummy_data.dart';
import 'package:e_commerce/data/product/product_repository.dart';
import 'package:e_commerce/data/repositories.authentication/authentication_repository.dart';
import 'package:e_commerce/features/shop/models/banner_model.dart';
import 'package:e_commerce/features/shop/models/categories_model.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart';

Future<void> main() async {


  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
      (FirebaseApp value) => Get.put(AuthenticationRepository()),
    );

  // Log or indicate that initialization is complete
  print("Firebase Initialized");
 // Get.put(ProductRepository());
 // Get.put(CategoryRepository());
 //Get.put(BannerRepository());

  


  // Run the app immediately
  runApp(const MyApp());


  // Future.delayed(Duration.zero, () async {
  //   try {
  //     final List<ProductModel> dummyProducts = DummyData.products;
  //     await ProductRepository.instance.uploadDummyData(dummyProducts);
  //     // final List<BannerModel> dummyBanners = DummyData.banners;
  //     // await BannerRepository.instance.uploadBanners(dummyBanners);
  //     print("Dummy data uploaded successfully");
  //   } catch (e) {
  //     print("Errors uploading dummy data: $e");
  //   } finally {
  //     // Remove the splash screen after upload completes or fails
  //     FlutterNativeSplash.remove();
  //   }
  // }
  //);
}
