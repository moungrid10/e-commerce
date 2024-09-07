import 'package:e_commerce/common/style/user_controller.dart';
import 'package:e_commerce/common/widgets/loaders.dart';
import 'package:e_commerce/common/widgets/network_manager.dart';
import 'package:e_commerce/common/widgets/user_repository.dart';
import 'package:e_commerce/features/shop/screens/profile/profile.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UpdateNameController extends GetxController{
  static UpdateNameController get instance => Get.find();


  final firstname = TextEditingController();
    final lastname = TextEditingController();

  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit(){
    initializNames();
    super.onInit();
  }

  Future<void> initializNames() async {
    firstname.text = userController.user.value.firstname;
    lastname.text = userController.user.value.lastname;


  }

  Future<void> updateUserName() async{
    try{
      FullScreenLoader.openLoadingDialog("We are updating your information...", "assets/images/store/adidas.png");


      final isConnected = await NetworkManager.instance.isConnected();
      if ( !isConnected){
        FullScreenLoader.stopLoading();
        return;
      }

      if (!updateUserNameFormKey.currentState!.validate()){
        FullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> name = {'FirstName': firstname.text.trim(), 'LastName': lastname.text.trim()};
      await userRepository.updateSingleField(name);


      userController.user.value.firstname = firstname.text.trim();
      userController.user.value.lastname = lastname.text.trim();


      FullScreenLoader.stopLoading();

      TLoaders.successSnackBar(title: 'Congratulation', message: 'your name has been updated');

      Get.off(()=> ProfileScreen());




    } catch(e){
      FullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "OH Snap", message: e.toString());
    }
  }

}