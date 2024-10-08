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
    apiKey: 'AIzaSyA7g5ctN7S1R_OTZT6_2z3nu6Z5_cJRo14',
    appId: '1:411871030126:web:2875a0b62f423ba703af7f',
    messagingSenderId: '411871030126',
    projectId: 'dbasep-50cf6',
    authDomain: 'dbasep-50cf6.firebaseapp.com',
    storageBucket: 'dbasep-50cf6.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC_gAkqsAov35eKxvoQ_yTYj-htxrDubqk',
    appId: '1:411871030126:android:51773ba477f0ec9703af7f',
    messagingSenderId: '411871030126',
    projectId: 'dbasep-50cf6',
    storageBucket: 'dbasep-50cf6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyACoFAFSJ-TEpCXkgW_iiS57ilUSG2sCLo',
    appId: '1:411871030126:ios:5f070d2637bd2e9203af7f',
    messagingSenderId: '411871030126',
    projectId: 'dbasep-50cf6',
    storageBucket: 'dbasep-50cf6.appspot.com',
    iosBundleId: 'com.example.testfire',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyACoFAFSJ-TEpCXkgW_iiS57ilUSG2sCLo',
    appId: '1:411871030126:ios:5f070d2637bd2e9203af7f',
    messagingSenderId: '411871030126',
    projectId: 'dbasep-50cf6',
    storageBucket: 'dbasep-50cf6.appspot.com',
    iosBundleId: 'com.example.testfire',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA7g5ctN7S1R_OTZT6_2z3nu6Z5_cJRo14',
    appId: '1:411871030126:web:f078a04211f82e3803af7f',
    messagingSenderId: '411871030126',
    projectId: 'dbasep-50cf6',
    authDomain: 'dbasep-50cf6.firebaseapp.com',
    storageBucket: 'dbasep-50cf6.appspot.com',
  );
}
