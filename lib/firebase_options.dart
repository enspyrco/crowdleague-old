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
    apiKey: 'AIzaSyCCY0ns9i98D1EiGpmNrYfMzzOrpyfKL6o',
    appId: '1:945991608888:web:a7bbadf13761d03e6314cd',
    messagingSenderId: '945991608888',
    projectId: 'crowdleague-project',
    authDomain: 'crowdleague-project.firebaseapp.com',
    storageBucket: 'crowdleague-project.firebasestorage.app',
    measurementId: 'G-YJW2EJMFMD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCBD19q1DpyVMUPXEr_XTvPytlh_AVVaaQ',
    appId: '1:945991608888:android:c10637a487d019ea6314cd',
    messagingSenderId: '945991608888',
    projectId: 'crowdleague-project',
    storageBucket: 'crowdleague-project.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAucqyBAKIpsdEs4y1M1ypgmrV1fPhyjcQ',
    appId: '1:945991608888:ios:093504da4819f8886314cd',
    messagingSenderId: '945991608888',
    projectId: 'crowdleague-project',
    storageBucket: 'crowdleague-project.firebasestorage.app',
    iosBundleId: 'com.example.crowdleague',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAucqyBAKIpsdEs4y1M1ypgmrV1fPhyjcQ',
    appId: '1:945991608888:ios:093504da4819f8886314cd',
    messagingSenderId: '945991608888',
    projectId: 'crowdleague-project',
    storageBucket: 'crowdleague-project.firebasestorage.app',
    iosBundleId: 'com.example.crowdleague',
  );
}
