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
    apiKey: 'AIzaSyCzkkCbkbtqL4N_rr5KddOV7hlIqeAsCrk',
    appId: '1:572368673238:web:5f817caae32a8ce498ec77',
    messagingSenderId: '572368673238',
    projectId: 'clubcalendar-ff6b0',
    authDomain: 'clubcalendar-ff6b0.firebaseapp.com',
    storageBucket: 'clubcalendar-ff6b0.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBnz6pfBTFhEONtVsxKP9TPUlwA2KwKOjE',
    appId: '1:572368673238:android:1ed059cb2a771f1698ec77',
    messagingSenderId: '572368673238',
    projectId: 'clubcalendar-ff6b0',
    storageBucket: 'clubcalendar-ff6b0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD8OlzZNCan0Nudm-aH_0HA7O9jpXzMpeY',
    appId: '1:572368673238:ios:7daea0a1ad34a7fe98ec77',
    messagingSenderId: '572368673238',
    projectId: 'clubcalendar-ff6b0',
    storageBucket: 'clubcalendar-ff6b0.appspot.com',
    androidClientId: '572368673238-kf41gvupsd5njc23d96hqb2b3fi1ehf7.apps.googleusercontent.com',
    iosClientId: '572368673238-vfssp759aqrefl5mutt219t836jf1r6i.apps.googleusercontent.com',
    iosBundleId: 'com.example.clubCalendar',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD8OlzZNCan0Nudm-aH_0HA7O9jpXzMpeY',
    appId: '1:572368673238:ios:7daea0a1ad34a7fe98ec77',
    messagingSenderId: '572368673238',
    projectId: 'clubcalendar-ff6b0',
    storageBucket: 'clubcalendar-ff6b0.appspot.com',
    androidClientId: '572368673238-kf41gvupsd5njc23d96hqb2b3fi1ehf7.apps.googleusercontent.com',
    iosClientId: '572368673238-vfssp759aqrefl5mutt219t836jf1r6i.apps.googleusercontent.com',
    iosBundleId: 'com.example.clubCalendar',
  );
}
