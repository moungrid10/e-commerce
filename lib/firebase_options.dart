// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyALkagUsJ_gtOvzdjcjp8C93lmDUmKPEcM',
    appId: '1:592308533655:web:b4f787ce6c974845e52cd2',
    messagingSenderId: '592308533655',
    projectId: 'e-commerce-c3e79',
    authDomain: 'e-commerce-c3e79.firebaseapp.com',
    storageBucket: 'e-commerce-c3e79.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyATXfNICNT_x_HwT4uh0pEI8cVJvA822pM',
    appId: '1:592308533655:android:b759b091f4cf1635e52cd2',
    messagingSenderId: '592308533655',
    projectId: 'e-commerce-c3e79',
    storageBucket: 'e-commerce-c3e79.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDZPPfGqYtbwQUgzy_5ldcG26GBeDY4rOM',
    appId: '1:592308533655:ios:48145b0501a6ca4ee52cd2',
    messagingSenderId: '592308533655',
    projectId: 'e-commerce-c3e79',
    storageBucket: 'e-commerce-c3e79.appspot.com',
    androidClientId: '592308533655-5seg4k5h3500b0d46b8o3nj1tuvo0oqv.apps.googleusercontent.com',
    iosClientId: '592308533655-butvtff6eqnnhv9slll52l5g9civpv92.apps.googleusercontent.com',
    iosBundleId: 'com.example.eCommerce',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDZPPfGqYtbwQUgzy_5ldcG26GBeDY4rOM',
    appId: '1:592308533655:ios:48145b0501a6ca4ee52cd2',
    messagingSenderId: '592308533655',
    projectId: 'e-commerce-c3e79',
    storageBucket: 'e-commerce-c3e79.appspot.com',
    androidClientId: '592308533655-5seg4k5h3500b0d46b8o3nj1tuvo0oqv.apps.googleusercontent.com',
    iosClientId: '592308533655-butvtff6eqnnhv9slll52l5g9civpv92.apps.googleusercontent.com',
    iosBundleId: 'com.example.eCommerce',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyALkagUsJ_gtOvzdjcjp8C93lmDUmKPEcM',
    appId: '1:592308533655:web:940d6167ac06a52ae52cd2',
    messagingSenderId: '592308533655',
    projectId: 'e-commerce-c3e79',
    authDomain: 'e-commerce-c3e79.firebaseapp.com',
    storageBucket: 'e-commerce-c3e79.appspot.com',
  );

}