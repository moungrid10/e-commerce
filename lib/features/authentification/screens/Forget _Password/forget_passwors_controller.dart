import 'package:e_commerce/common/widgets/loaders.dart';
import 'package:e_commerce/common/widgets/network_manager.dart';
import 'package:e_commerce/data/repositories.authentication/authentication_repository.dart';
import 'package:e_commerce/features/authentification/screens/Forget%20_Password/reset_passwrof.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassworsController extends GetxController{
  static ForgetPassworsController get instance => Get.find();


  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail()async{
    try{
      FullScreenLoader.openLoadingDialog('Processing your request.....', "assets/images/store/nike.png");

      
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){

        FullScreenLoader.stopLoading();
        return;
        }
      if(!forgetPasswordFormKey.currentState!.validate()){
        FullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());


      FullScreenLoader.stopLoading();

        TLoaders.successSnackBar(title: "Email sent",message: "Email link Sent to Resst your password".tr);

      Get.to(()=> Reset_Password(email: email.text.trim()));


    } catch(e){
      FullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap!",message: e.toString());
    }
  }


  resendPasswordResetEmail(String email)async {
    try{
       FullScreenLoader.openLoadingDialog('Processing your request.....', "assets/images/store/nike.png");

      
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){

        FullScreenLoader.stopLoading();
        return;
        }


        await AuthenticationRepository.instance.sendPasswordResetEmail(email);

        FullScreenLoader.stopLoading();

        TLoaders.successSnackBar(title: "Email sent",message: "Email link Sent to Resst your password".tr);


      
    } catch(e){
      FullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap!",message: e.toString());
    }
  }


 }