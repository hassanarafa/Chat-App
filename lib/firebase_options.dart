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
    apiKey: 'AIzaSyAB9AfdJtyBZCJex4NpbkkQe5CTTfB2Z-8',
    appId: '1:772403258439:web:d063b9d7b1d6fd3e423d62',
    messagingSenderId: '772403258439',
    projectId: 'project2-8fe71',
    authDomain: 'project2-8fe71.firebaseapp.com',
    storageBucket: 'project2-8fe71.appspot.com',
    measurementId: 'G-YT731MXL4G',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD5ey1OPFm8dfQW5QgjK8oIxpo3bLiL85A',
    appId: '1:772403258439:android:369ada8a1e7c5f15423d62',
    messagingSenderId: '772403258439',
    projectId: 'project2-8fe71',
    storageBucket: 'project2-8fe71.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD2e7i5luRFemNHCCHM6qvsjCnD-QuyEqc',
    appId: '1:772403258439:ios:df7da09b627381ec423d62',
    messagingSenderId: '772403258439',
    projectId: 'project2-8fe71',
    storageBucket: 'project2-8fe71.appspot.com',
    androidClientId: '772403258439-eis85dqqfjibupp9o1bk2gqa2v8orjo3.apps.googleusercontent.com',
    iosClientId: '772403258439-npgpp721mjfv2uskban6idj4r6t125dj.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD2e7i5luRFemNHCCHM6qvsjCnD-QuyEqc',
    appId: '1:772403258439:ios:873c5abff907fa71423d62',
    messagingSenderId: '772403258439',
    projectId: 'project2-8fe71',
    storageBucket: 'project2-8fe71.appspot.com',
    androidClientId: '772403258439-eis85dqqfjibupp9o1bk2gqa2v8orjo3.apps.googleusercontent.com',
    iosClientId: '772403258439-cpfilhjit908lrgajulpiudefdm0vnmg.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatapp.RunnerTests',
  );
}
