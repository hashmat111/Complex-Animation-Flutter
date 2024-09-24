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
    apiKey: 'AIzaSyDTYpUEXKS53WxYbzgTXgjccBTU2_sIgx0',
    appId: '1:810600334798:web:e682169b072698bc2bd79f',
    messagingSenderId: '810600334798',
    projectId: 'newone-1f097',
    authDomain: 'newone-1f097.firebaseapp.com',
    storageBucket: 'newone-1f097.appspot.com',
    measurementId: 'G-PQ7WWWLBPN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAD6GzNqB6d-F81YWPHMIfKvzQnPxOGLoE',
    appId: '1:810600334798:android:cb4f9386440b14872bd79f',
    messagingSenderId: '810600334798',
    projectId: 'newone-1f097',
    storageBucket: 'newone-1f097.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAsqk7jTD11Nsy1CRagKoaT_6VoeGRGA74',
    appId: '1:810600334798:ios:3ea574a10710e5cc2bd79f',
    messagingSenderId: '810600334798',
    projectId: 'newone-1f097',
    storageBucket: 'newone-1f097.appspot.com',
    iosBundleId: 'com.example.locaservice',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAsqk7jTD11Nsy1CRagKoaT_6VoeGRGA74',
    appId: '1:810600334798:ios:3ea574a10710e5cc2bd79f',
    messagingSenderId: '810600334798',
    projectId: 'newone-1f097',
    storageBucket: 'newone-1f097.appspot.com',
    iosBundleId: 'com.example.locaservice',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDTYpUEXKS53WxYbzgTXgjccBTU2_sIgx0',
    appId: '1:810600334798:web:cf3ad41922d68ce62bd79f',
    messagingSenderId: '810600334798',
    projectId: 'newone-1f097',
    authDomain: 'newone-1f097.firebaseapp.com',
    storageBucket: 'newone-1f097.appspot.com',
    measurementId: 'G-4TTG472FVW',
  );
}
