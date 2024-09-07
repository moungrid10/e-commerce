import 'package:e_commerce/common/style/user_controller.dart';
import 'package:e_commerce/common/widgets/loaders.dart';
import 'package:e_commerce/common/widgets/network_manager.dart';
import 'package:e_commerce/data/repositories.authentication/authentication_repository.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController{
   
   static LoginController get instance => Get.find();
   
   final localStorage = GetStorage();
   final email = TextEditingController();
   final password = TextEditingController();
   final hidePasssword = true.obs;
   final rememberMe = true.obs;
   GlobalKey<FormState> loginFormKey = GlobalKey<FormState>(); 
   final userController = Get.put(UserController());

   @override
  void onInit() {
  email.text = localStorage.read("REMEMBER_ME_EMAIL") ?? "";
  password.text = localStorage.read("REMEMBER_ME_PASSWORD") ?? "";
  super.onInit();
}

   Future<void> emailAndPasswordSignIn() async {
    try{
      FullScreenLoader.openLoadingDialog("We are processing your information...", "assets/images/store/nike.png");


      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){

        FullScreenLoader.stopLoading();
        return;
      }


      if(loginFormKey.currentState!.validate()){
        FullScreenLoader.stopLoading();
       
        return;
      }
        if(rememberMe.value){
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
        
      }

      final userCredential =  await AuthenticationRepository.instance.loginWithEmailandPassword(email.text.trim(), password.text.trim());


      FullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();
    } catch(e){
       FullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
   }
   
   Future<void> googleSignIn() async {
    try{
      FullScreenLoader.openLoadingDialog('Logging you in .....', "assets/images/store/nike.png");

      
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){

        FullScreenLoader.stopLoading();
        return;
      }

      final userCredentials =  await AuthenticationRepository.instance.signInWithGoogle();

      await userController.saveUserRecord(userCredentials);


      FullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();


    }catch(e){
      FullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap!",message: e.toString());
    }
   }
}