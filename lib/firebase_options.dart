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
    apiKey: 'AIzaSyC1aqINP80pwEXbSCA-EUHeXMrZWigIONk',
    appId: '1:1098462323419:web:f6ba231d3d4c4a27a822fe',
    messagingSenderId: '1098462323419',
    projectId: 'socialive-db7da',
    authDomain: 'socialive-db7da.firebaseapp.com',
    storageBucket: 'socialive-db7da.appspot.com',
    measurementId: 'G-JQZELL9X63',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAyuEkedwpatUknGaQ4OSFGu9n-mkUplfA',
    appId: '1:1098462323419:android:737e68ff860562baa822fe',
    messagingSenderId: '1098462323419',
    projectId: 'socialive-db7da',
    storageBucket: 'socialive-db7da.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAPzN3UTNreNsgCJ338I-Sb9QfnAI2H69o',
    appId: '1:1098462323419:ios:99e49878ec7e2beda822fe',
    messagingSenderId: '1098462323419',
    projectId: 'socialive-db7da',
    storageBucket: 'socialive-db7da.appspot.com',
    iosBundleId: 'com.example.fvm',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAPzN3UTNreNsgCJ338I-Sb9QfnAI2H69o',
    appId: '1:1098462323419:ios:99e49878ec7e2beda822fe',
    messagingSenderId: '1098462323419',
    projectId: 'socialive-db7da',
    storageBucket: 'socialive-db7da.appspot.com',
    iosBundleId: 'com.example.fvm',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC1aqINP80pwEXbSCA-EUHeXMrZWigIONk',
    appId: '1:1098462323419:web:c3e2a0dc364b40d9a822fe',
    messagingSenderId: '1098462323419',
    projectId: 'socialive-db7da',
    authDomain: 'socialive-db7da.firebaseapp.com',
    storageBucket: 'socialive-db7da.appspot.com',
    measurementId: 'G-C7T963KZHJ',
  );

}