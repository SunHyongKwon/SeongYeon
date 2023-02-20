// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCCbK1cQxMg9yb71HtDSKc83IK761lPDDU',
    appId: '1:177777580232:web:0c47d4be949107dc27edfd',
    messagingSenderId: '177777580232',
    projectId: 'seongyeon-e4bd3',
    authDomain: 'seongyeon-e4bd3.firebaseapp.com',
    storageBucket: 'seongyeon-e4bd3.appspot.com',
    measurementId: 'G-MXNEPTJRMV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAEiOjIXOzQ4glAD7Qd5ZTY3uhxhEQGIjo',
    appId: '1:177777580232:android:446af6a8ecba143b27edfd',
    messagingSenderId: '177777580232',
    projectId: 'seongyeon-e4bd3',
    storageBucket: 'seongyeon-e4bd3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA5aDr-cj5SUi5z0_GXCgmrvBGwdxJZs0s',
    appId: '1:177777580232:ios:cae07535e80a8bed27edfd',
    messagingSenderId: '177777580232',
    projectId: 'seongyeon-e4bd3',
    storageBucket: 'seongyeon-e4bd3.appspot.com',
    iosClientId:
        '177777580232-av76rntvoof818r1flulik5p04dvusm9.apps.googleusercontent.com',
    iosBundleId: 'com.example.pjTest',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA5aDr-cj5SUi5z0_GXCgmrvBGwdxJZs0s',
    appId: '1:177777580232:ios:cae07535e80a8bed27edfd',
    messagingSenderId: '177777580232',
    projectId: 'seongyeon-e4bd3',
    storageBucket: 'seongyeon-e4bd3.appspot.com',
    iosClientId:
        '177777580232-av76rntvoof818r1flulik5p04dvusm9.apps.googleusercontent.com',
    iosBundleId: 'com.example.pjTest',
  );
}
