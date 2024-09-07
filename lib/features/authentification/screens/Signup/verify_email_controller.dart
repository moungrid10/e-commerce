import 'dart:async';

import 'package:e_commerce/common/widgets/loaders.dart';
import 'package:e_commerce/data/repositories.authentication/authentication_repository.dart';
import 'package:e_commerce/features/authentification/screens/Signup/SuccesScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController{
  static VerifyEmailController get instance => Get.find();


  @override
  void onInit(){
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }



  sendEmailVerification() async {
    try{
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(title: "Email sent", message: "please check your inbox and verify email");
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  setTimerForAutoRedirect(){
    Timer.periodic(Duration(seconds: 1), (timer) async{
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if(user?.emailVerified ?? false){
        timer.cancel();
        Get.off(
          ()=> SuccessScreen(image: "assets/images/email_verify/mission.gif",
          title: "Your account successfully created!",
          subTitle: "Congratulations! welcome to this journey, find a product and it will arrive to your home , press continue to start",

          onPressed: ()=> AuthenticationRepository.instance.screenRedirect),
        );
      }
    }
    );
  }

  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser != null && currentUser.emailVerified){
      Get.off(
        ()=> SuccessScreen(image: "assets/images/email_verify/mission.gif",
          title: "Your account successfully created!",
          subTitle: "Congratulations! welcome to this journey, find a product and it will arrive to your home , press continue to start",

          onPressed: ()=> AuthenticationRepository.instance.screenRedirect)
      );
    }

  }

}