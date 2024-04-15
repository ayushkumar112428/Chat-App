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
    apiKey: 'AIzaSyBAcRVxEiN8ZqfF_N0bUoqyFkWEa5N5CFg',
    appId: '1:872223844770:web:f53c2a20a87e964f02eafb',
    messagingSenderId: '872223844770',
    projectId: 'chat-app-2ebfa',
    authDomain: 'chat-app-2ebfa.firebaseapp.com',
    storageBucket: 'chat-app-2ebfa.appspot.com',
    measurementId: 'G-FPX5S6GPEK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAMszNpUdGfrg90LjhXxRZBSdW1Ac7A4BE',
    appId: '1:872223844770:android:db337dab9cc96eff02eafb',
    messagingSenderId: '872223844770',
    projectId: 'chat-app-2ebfa',
    storageBucket: 'chat-app-2ebfa.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBEbdD5SOwSJxnznR2IhosP1avD824X4qc',
    appId: '1:872223844770:ios:85f6da57f36d633702eafb',
    messagingSenderId: '872223844770',
    projectId: 'chat-app-2ebfa',
    storageBucket: 'chat-app-2ebfa.appspot.com',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBEbdD5SOwSJxnznR2IhosP1avD824X4qc',
    appId: '1:872223844770:ios:85f6da57f36d633702eafb',
    messagingSenderId: '872223844770',
    projectId: 'chat-app-2ebfa',
    storageBucket: 'chat-app-2ebfa.appspot.com',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBAcRVxEiN8ZqfF_N0bUoqyFkWEa5N5CFg',
    appId: '1:872223844770:web:3cd0bf8beb7ce6ea02eafb',
    messagingSenderId: '872223844770',
    projectId: 'chat-app-2ebfa',
    authDomain: 'chat-app-2ebfa.firebaseapp.com',
    storageBucket: 'chat-app-2ebfa.appspot.com',
    measurementId: 'G-D7KR0ZV0ZR',
  );
}