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
    apiKey: 'AIzaSyAT5wmacl7-ELZUqpGGwGepLm7OgLZFqCo',
    appId: '1:908390481598:web:40573a16f79274223b68ef',
    messagingSenderId: '908390481598',
    projectId: 'fir-test-task-5782a',
    authDomain: 'fir-test-task-5782a.firebaseapp.com',
    storageBucket: 'fir-test-task-5782a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDrZ_R_NtHK9oz_dimNC0KNKQkdZtE4meE',
    appId: '1:908390481598:android:27a8b0f1e9c342783b68ef',
    messagingSenderId: '908390481598',
    projectId: 'fir-test-task-5782a',
    storageBucket: 'fir-test-task-5782a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyByDjGSR8KBpKVJDnaJaALyeAy41_HpfUc',
    appId: '1:908390481598:ios:ec0877252ab44c0d3b68ef',
    messagingSenderId: '908390481598',
    projectId: 'fir-test-task-5782a',
    storageBucket: 'fir-test-task-5782a.appspot.com',
    iosBundleId: 'com.example.taskTesting',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyByDjGSR8KBpKVJDnaJaALyeAy41_HpfUc',
    appId: '1:908390481598:ios:b0199fa4174c910b3b68ef',
    messagingSenderId: '908390481598',
    projectId: 'fir-test-task-5782a',
    storageBucket: 'fir-test-task-5782a.appspot.com',
    iosBundleId: 'com.example.taskTesting.RunnerTests',
  );
}
