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
    apiKey: 'AIzaSyAop5MocCUZTTvSNs2gDzbit1BkDDge5gE',
    appId: '1:1033221744519:web:03e6ad896243e334f21522',
    messagingSenderId: '1033221744519',
    projectId: 'student-31fa4',
    authDomain: 'student-31fa4.firebaseapp.com',
    databaseURL: 'https://student-31fa4-default-rtdb.firebaseio.com',
    storageBucket: 'student-31fa4.appspot.com',
    measurementId: 'G-R2NNQLSLDL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDOiQD357I7Wbk1fSkXm2GmzClmgoFLA3c',
    appId: '1:1033221744519:android:e2ff793cfab9a390f21522',
    messagingSenderId: '1033221744519',
    projectId: 'student-31fa4',
    databaseURL: 'https://student-31fa4-default-rtdb.firebaseio.com',
    storageBucket: 'student-31fa4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBI6nHiT8e-qMlAFmjMjhPEFuQjoWbVcEQ',
    appId: '1:1033221744519:ios:007613591f29282bf21522',
    messagingSenderId: '1033221744519',
    projectId: 'student-31fa4',
    databaseURL: 'https://student-31fa4-default-rtdb.firebaseio.com',
    storageBucket: 'student-31fa4.appspot.com',
    androidClientId: '1033221744519-ke5f5m4musu7iufij3j27lqesm49ohii.apps.googleusercontent.com',
    iosBundleId: 'com.example.studentTeacher',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBI6nHiT8e-qMlAFmjMjhPEFuQjoWbVcEQ',
    appId: '1:1033221744519:ios:007613591f29282bf21522',
    messagingSenderId: '1033221744519',
    projectId: 'student-31fa4',
    databaseURL: 'https://student-31fa4-default-rtdb.firebaseio.com',
    storageBucket: 'student-31fa4.appspot.com',
    androidClientId: '1033221744519-ke5f5m4musu7iufij3j27lqesm49ohii.apps.googleusercontent.com',
    iosBundleId: 'com.example.studentTeacher',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAop5MocCUZTTvSNs2gDzbit1BkDDge5gE',
    appId: '1:1033221744519:web:6075e303deee177af21522',
    messagingSenderId: '1033221744519',
    projectId: 'student-31fa4',
    authDomain: 'student-31fa4.firebaseapp.com',
    databaseURL: 'https://student-31fa4-default-rtdb.firebaseio.com',
    storageBucket: 'student-31fa4.appspot.com',
    measurementId: 'G-8MM1R3FR66',
  );
}
