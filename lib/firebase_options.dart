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
    apiKey: 'AIzaSyCrSjfCEsnigo3OFvGqPY1nv2JgXeSBSRs',
    appId: '1:765580233968:web:cda85d5199462cbacd0635',
    messagingSenderId: '765580233968',
    projectId: 'technicians-8de59',
    authDomain: 'technicians-8de59.firebaseapp.com',
    storageBucket: 'technicians-8de59.appspot.com',
    measurementId: 'G-JB005TW3N9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAnFQ-2zLfBykxZYDtcLBVl18Badk-vBUo',
    appId: '1:765580233968:android:611c92cc094fd3ebcd0635',
    messagingSenderId: '765580233968',
    projectId: 'technicians-8de59',
    storageBucket: 'technicians-8de59.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBeB8iY-gu_1BDxkQ5nO7O4xUdtgPRsvtQ',
    appId: '1:765580233968:ios:0cdd860dfa0221c8cd0635',
    messagingSenderId: '765580233968',
    projectId: 'technicians-8de59',
    storageBucket: 'technicians-8de59.appspot.com',
    iosBundleId: 'com.example.technicians',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBeB8iY-gu_1BDxkQ5nO7O4xUdtgPRsvtQ',
    appId: '1:765580233968:ios:248c081ed23067e9cd0635',
    messagingSenderId: '765580233968',
    projectId: 'technicians-8de59',
    storageBucket: 'technicians-8de59.appspot.com',
    iosBundleId: 'com.example.technicians.RunnerTests',
  );
}
