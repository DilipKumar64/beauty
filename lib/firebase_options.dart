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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBLGT8_HBbFohR9g1HOR7CqJ68sI3Kc3Aw',
    appId: '1:925629266227:android:944d51facce61491fa2646',
    messagingSenderId: '925629266227',
    projectId: 'beauty-bd2e4',
    storageBucket: 'beauty-bd2e4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDGwan5G50HTkZothQaNDpHm3GsS2SEl04',
    appId: '1:925629266227:ios:d0fad294d484a132fa2646',
    messagingSenderId: '925629266227',
    projectId: 'beauty-bd2e4',
    storageBucket: 'beauty-bd2e4.appspot.com',
    androidClientId: '925629266227-b90jdvci4loipo8dn43jtcjcbn3vcju4.apps.googleusercontent.com',
    iosClientId: '925629266227-a93i85v3eqhteataed8l4retv3s9hm13.apps.googleusercontent.com',
    iosBundleId: 'com.example.beauty',
  );
}
