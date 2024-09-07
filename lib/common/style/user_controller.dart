import 'package:e_commerce/common/widgets/loaders.dart';
import 'package:e_commerce/common/widgets/network_manager.dart';
import 'package:e_commerce/common/widgets/user_model.dart';
import 'package:e_commerce/common/widgets/user_repository.dart';
import 'package:e_commerce/data/repositories.authentication/authentication_repository.dart';
import 'package:e_commerce/features/authentification/screens/Login/login.dart';
import 'package:e_commerce/features/shop/screens/profile/re_authenticate_user_login_form.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController{
  static UserController get instance => Get.find();
  
  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final imageUploading = false.obs;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
   super.onInit();
   fetchUserRecord();
  }

  Future<void> fetchUserRecord() async{
    try{
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetaills();
      this.user(user);

    } catch(e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value=false;
    }
  }

  Future<void> saveUserRecord(UserCredential? userCredentials)async{
    try{
      await fetchUserRecord();
      if (user.value.id.isEmpty){
      if (userCredentials != null){

        final nameParts = UserModel.nameParts(userCredentials.user!.displayName ?? '');
        final username = UserModel.generateUsername(userCredentials.user!.displayName ?? '');


        final user = UserModel(
          id: userCredentials.user!.uid, 
          firstname: nameParts[0], 
          lastname: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '', 
          username: username, 
          email: userCredentials.user!.email ?? '', 
          phoneNumber: userCredentials.user!.phoneNumber ?? '', 
          profilePicture: userCredentials.user!.photoURL ?? '');

          await userRepository.saveUserRecord(user);

      }
      }
    } catch (e){
      TLoaders.warningSnackBar(title: "Data not saved",
      message: "Something went wrong while saving you informations, you can re-save your data in your profile");
    }
  }

  void deleteAccountWarningPopup(){
    Get.defaultDialog(
      contentPadding: EdgeInsets.all(TSizes.md),
      title: 'Delete Account',
      middleText: "Are you sure ?",
      confirm: ElevatedButton(onPressed: ()async => deleteUserAcount(),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red, side: BorderSide(color: Colors.red)),
      child: Padding(padding: EdgeInsets.symmetric(horizontal: TSizes.lg),child: Text('Delete'),)
      ),
      cancel: OutlinedButton(onPressed: () => Navigator.of(Get.overlayContext!).pop(), 
      child: Text('Cancel') ),
    );
  }
  void deleteUserAcount() async{
    try{
    FullScreenLoader.openLoadingDialog('Processing...', "assets/images/store/adidas.png");

    final auth = AuthenticationRepository.instance;
    final provider = auth.authUser!.providerData.map((e) => e.providerId).first;
    if (provider.isNotEmpty){
      if(provider == 'google.com'){
        await auth.signInWithGoogle();
        await auth.deleteAccount();
        FullScreenLoader.stopLoading();
        Get.offAll(()=> LoginScreen());
      } else if(provider == 'password') {
        FullScreenLoader.stopLoading();
        Get.to(()=> ReAuthLoginForm());
        
      }
    }
  }catch(e){
    FullScreenLoader.stopLoading();
    TLoaders.warningSnackBar(title: "Oh Snap!", message: e.toString());
  }
  }
  

  Future<void> reAuthenticateEmailAndPasswordUser() async{
    try{
      FullScreenLoader.openLoadingDialog('Processing', "assets/images/store/adidas.png");

      final isConnected = await NetworkManager.instance.isConnected();
      if ( !isConnected){
        FullScreenLoader.stopLoading();
        return;
      }
       if (!reAuthFormKey.currentState!.validate()){
        FullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      FullScreenLoader.stopLoading();
      Get.offAll(()=> LoginScreen());
    } catch(e){
      FullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "OH Snap", message: e.toString());
    }
  }

  uploadUserProfilePicture()async{
     try{
      final image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70, maxHeight: 512, maxWidth: 512);
      if(image != null){
        imageUploading.value = true;

        final imageUrl = await userRepository.uploadImage('Users/Images/Profile/', image);

        Map<String,dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);
        user.value.profilePicture = imageUrl;
        user.refresh();
        TLoaders.successSnackBar(title: "Congatulation ", message: "Your profile picture has been updated");

      }
     } catch(e){
            TLoaders.errorSnackBar(title: "OH Snap", message: e.toString());

     } finally{
      imageUploading.value=false;
     }
  }

}