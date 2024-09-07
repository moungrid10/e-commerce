import 'package:e_commerce/Bottom_Nav_Bar.dart';
import 'package:e_commerce/Exceptions/custom_exceptions.dart';
import 'package:e_commerce/common/widgets/user_repository.dart';
import 'package:e_commerce/features/authentification/screens/Login/login.dart';
import 'package:e_commerce/features/authentification/screens/Onboarding/onboarding.dart';
import 'package:e_commerce/features/authentification/screens/Signup/email_verify.dart';
import 'package:e_commerce/utils/local_storage/storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  User? get authUser => _auth.currentUser;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  Future<void> screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        
        await TLocalStorage.init(user.uid);

        Get.offAll(() => Navigation_bar());

      } else {
        Get.offAll(() => VerifyEmailScreen(email: user.email));
      }
    } else {
      deviceStorage.writeIfNull('IsFirstTime', true);
      final isFirstTime = deviceStorage.read('IsFirstTime') as bool?;
      if (isFirstTime == false) {
        Get.offAll(() => LoginScreen());
      } else {
        Get.offAll(() => OnBoardingClass());
      }
    }
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
      Get.offAll(() => LoginScreen());
    } catch (e) {
      Get.snackbar('Error', 'Failed to sign out. Please try again.');
    }
  }

  Future<UserCredential> loginWithEmailandPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.message ?? 'Unknown Firebase Auth error');
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.message ?? 'Unknown Firebase error');
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.message ?? 'Unknown Platform error');
    } catch (e) {
      throw 'Something went wrong, Please try again: $e';
    }
  }

  Future<UserCredential> registerWithEmailandPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.message ?? 'Unknown Firebase Auth error');
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.message ?? 'Unknown Firebase error');
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.message ?? 'Unknown Platform error');
    } catch (e) {
      throw 'Something went wrong, Please try again: $e';
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.message ?? 'Unknown Firebase Auth error');
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.message ?? 'Unknown Firebase error');
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.message ?? 'Unknown Platform error');
    } catch (e) {
      throw 'Something went wrong, Please try again: $e';
    }
  }


  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.message ?? 'Unknown Firebase Auth error');
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.message ?? 'Unknown Firebase error');
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.message ?? 'Unknown Platform error');
    } catch (e) {
      throw 'Something went wrong, Please try again: $e';
    }
  }




  Future<UserCredential?> signInWithGoogle() async{

    try{
    final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;


    final credentials = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

    return await _auth.signInWithCredential(credentials);


  } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.message ?? 'Unknown Firebase Auth error');
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.message ?? 'Unknown Firebase error');
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.message ?? 'Unknown Platform error');
    } catch (e) {
      if (kDebugMode) print('Something went wrong: $e') ;
      return null;
    }
  }

  Future<void> reAuthenticateWithEmailAndPassword (String email, String password)async{
    try{
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);

      await _auth.currentUser!.reauthenticateWithCredential(credential);
      
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.message ?? 'Unknown Firebase Auth error');
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.message ?? 'Unknown Firebase error');
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.message ?? 'Unknown Platform error');
    } catch (e) {
      if (kDebugMode) print('Something went wrong: $e') ;
      return null;
    }
  }

  Future<void> deleteAccount() async{
    try{
      await UserRepository.instance.removeUserRecoed(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();

    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.message ?? 'Unknown Firebase Auth error');
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.message ?? 'Unknown Firebase error');
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.message ?? 'Unknown Platform error');
    } catch (e) {
      if (kDebugMode) print('Something went wrong: $e') ;
      return null;
    }
  }
}
