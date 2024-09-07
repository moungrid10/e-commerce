import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/Exceptions/custom_exceptions.dart';
import 'package:e_commerce/data/repositories.authentication/authentication_repository.dart';
import 'package:e_commerce/features/shop/models/address_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AdressRepository extends GetxController {
  static AdressRepository get instance => Get.find();


  final _db = FirebaseFirestore.instance;

  
Future<List<AddressModel>> fetchUserAddresses() async {

try {
final userId =AuthenticationRepository.instance.authUser!.uid;
if(userId.isEmpty) throw 'Unable to find user information, thry again later';

final result = await _db.collection('Users').doc(userId).collection('Addresses').get();
return result.docs.map((documentSnapshot)=> AddressModel.fromDocumentSnapshot(documentSnapshot)).toList();

} catch (e) {
  throw 'Something went wrong. Please try again';
}}

Future<void> updateSelectedField(String adressId, bool selected) async {

try {
final userId =AuthenticationRepository.instance.authUser!.uid;

 await _db.collection('Users').doc(userId).collection('Addresses').doc(adressId).update({'SelectedAddress':selected});

} catch (e) {
  throw 'Something went wrong. Please try again';
}}



Future<String> addAddress(AddressModel address) async {

try {
final userId =AuthenticationRepository.instance.authUser!.uid;

 final currentAddress = await _db.collection('Users').doc(userId).collection('Addresses').add(address.toJson());
 return currentAddress.id;

} catch (e) {
  throw 'Something went wrong. Please try again';
}}


}