// File: lib/firebase_options.dart

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCmULdxV95k_LfO-djA8GlK0tluLfv_gfQ',
    appId: '1:825950684841:web:1b3d61ce43bf9016e40bb8',
    messagingSenderId: '825950684841',
    projectId: 'food-app-6bcdf',
    authDomain: 'food-app-6bcdf.firebaseapp.com',
    storageBucket: 'food-app-6bcdf.appspot.com',
    measurementId: 'G-MQZ66NYN3C',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCmULdxV95k_LfO-djA8GlK0tluLfv_gfQ',
    appId: '1:825950684841:android:xxxxxxxxxxxxxxxx', // ضع App ID الخاص بالـ Android إذا كنت تملكه
    messagingSenderId: '825950684841',
    projectId: 'food-app-6bcdf',
    storageBucket: 'food-app-6bcdf.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCmULdxV95k_LfO-djA8GlK0tluLfv_gfQ',
    appId: '1:825950684841:ios:xxxxxxxxxxxxxxxx', // ضع App ID الخاص بالـ iOS إذا كنت تملكه
    messagingSenderId: '825950684841',
    projectId: 'food-app-6bcdf',
    storageBucket: 'food-app-6bcdf.appspot.com',
    iosBundleId: 'com.example.flutterApplication7',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCmULdxV95k_LfO-djA8GlK0tluLfv_gfQ',
    appId: '1:825950684841:ios:xxxxxxxxxxxxxxxx', // ممكن يكون نفسه مثل iOS
    messagingSenderId: '825950684841',
    projectId: 'food-app-6bcdf',
    storageBucket: 'food-app-6bcdf.appspot.com',
    iosBundleId: 'com.example.flutterApplication7',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCmULdxV95k_LfO-djA8GlK0tluLfv_gfQ',
    appId: '1:825950684841:web:1b3d61ce43bf9016e40bb8',
    messagingSenderId: '825950684841',
    projectId: 'food-app-6bcdf',
    storageBucket: 'food-app-6bcdf.appspot.com',
  );
}
