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
    apiKey: 'AIzaSyDDuMJ81qTTYYcusyA5SzmHbvAwlx5aI_I',
    appId: '1:587994931194:web:e54fce6b9884f7a7064e43',
    messagingSenderId: '587994931194',
    projectId: 'paseando-pets-6c060',
    authDomain: 'paseando-pets-6c060.firebaseapp.com',
    storageBucket: 'paseando-pets-6c060.appspot.com',
    measurementId: 'G-0KNTWYL15Z',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBKFRmOmcSu8g2gpf0JAA80PLviL8S2NB4',
    appId: '1:587994931194:android:02a720d7270864dc064e43',
    messagingSenderId: '587994931194',
    projectId: 'paseando-pets-6c060',
    storageBucket: 'paseando-pets-6c060.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDzBsDCz5ocxaJ2p3319XJMP8hJ_oDMHEs',
    appId: '1:587994931194:ios:53d4de7a205809c6064e43',
    messagingSenderId: '587994931194',
    projectId: 'paseando-pets-6c060',
    storageBucket: 'paseando-pets-6c060.appspot.com',
    iosClientId: '587994931194-3dn5a19ftijl2m3r7rnjki27kjecki4a.apps.googleusercontent.com',
    iosBundleId: 'com.udea.paseandoPets',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDzBsDCz5ocxaJ2p3319XJMP8hJ_oDMHEs',
    appId: '1:587994931194:ios:53d4de7a205809c6064e43',
    messagingSenderId: '587994931194',
    projectId: 'paseando-pets-6c060',
    storageBucket: 'paseando-pets-6c060.appspot.com',
    iosClientId: '587994931194-3dn5a19ftijl2m3r7rnjki27kjecki4a.apps.googleusercontent.com',
    iosBundleId: 'com.udea.paseandoPets',
  );
}