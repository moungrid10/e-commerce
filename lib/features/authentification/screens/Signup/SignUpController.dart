import 'package:e_commerce/common/widgets/loaders.dart';
import 'package:e_commerce/common/widgets/network_manager.dart';
import 'package:e_commerce/common/widgets/user_model.dart';
import 'package:e_commerce/common/widgets/user_repository.dart';
import 'package:e_commerce/data/repositories.authentication/authentication_repository.dart';
import 'package:e_commerce/features/authentification/screens/Signup/email_verify.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signupcontroller extends GetxController{
   
   static Signupcontroller get instance => Get.find();
   
   final privacypolicy = true.obs;
   final hidePasssword = true.obs;
   final email = TextEditingController();
   final lastname = TextEditingController();
   final username = TextEditingController();
   final phoneNumber = TextEditingController();
   final firstname = TextEditingController();
   final password = TextEditingController();
   GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); 



   void signup() async{
    try{
      FullScreenLoader.openLoadingDialog("We are processing your information...", "assets/images/store/nike.png");


      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){

        FullScreenLoader.stopLoading();
        return;
      }


      if(!signupFormKey.currentState!.validate()){
        FullScreenLoader.stopLoading();
       
        return;
      }

      if(!privacypolicy.value){
        TLoaders.warningSnackBar(title: "Accept  Privacy policy", message: "In order to create account you have to read and accept the privacy policy & terms of use");
        return;
      }

      final userCredential =  await AuthenticationRepository.instance.registerWithEmailandPassword(email.text.trim(), password.text.trim());


      final newUser = UserModel(
        id:userCredential.user!.uid,
        firstname:firstname.text.trim(),
        lastname:lastname.text.trim(),
        username:username.text.trim(),
        email:email.text.trim(),
        phoneNumber:phoneNumber.text.trim(),
        profilePicture:'');

        final userRepository = Get.put(UserRepository()); 

        await userRepository.saveUserRecord(newUser);

        FullScreenLoader.stopLoading();

        TLoaders.successSnackBar(title: "Congratulation", message: "Your account has been created! Verify email to continue ");

        Get.to(()=> VerifyEmailScreen(email: email.text.trim(),));









     } catch(e) {

      FullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());


     } 
   }


}