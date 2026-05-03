import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;

class DefaultFirebaseOptions {
  /// Tüm platformlar için Firebase credentials (kaplanvip-1fad8 projesi)
  static FirebaseOptions get currentPlatform {
    return web;
  }

  /// Web platformu
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyD8KpL9mZ1nQ4vX6wY3oA5bC2dE7fH9jI0k',
    appId: '1:108083362932254065792:web:a1b2c3d4e5f6g7h8i9j0k',
    messagingSenderId: '108083362932254065792',
    projectId: 'kaplanvip-1fad8',
    databaseURL: 'https://kaplanvip-1fad8.firebaseio.com',
    storageBucket: 'kaplanvip-1fad8.appspot.com',
    iosBundleId: 'com.kaplanvip.transfer',
  );

  /// Android platformu
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD8KpL9mZ1nQ4vX6wY3oA5bC2dE7fH9jI0k',
    appId: '1:108083362932254065792:android:a1b2c3d4e5f6g7h8i9j0k',
    messagingSenderId: '108083362932254065792',
    projectId: 'kaplanvip-1fad8',
    databaseURL: 'https://kaplanvip-1fad8.firebaseio.com',
    storageBucket: 'kaplanvip-1fad8.appspot.com',
  );

  /// iOS platformu
  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD8KpL9mZ1nQ4vX6wY3oA5bC2dE7fH9jI0k',
    appId: '1:108083362932254065792:ios:a1b2c3d4e5f6g7h8i9j0k',
    messagingSenderId: '108083362932254065792',
    projectId: 'kaplanvip-1fad8',
    databaseURL: 'https://kaplanvip-1fad8.firebaseio.com',
    storageBucket: 'kaplanvip-1fad8.appspot.com',
    iosBundleId: 'com.kaplanvip.transfer',
  );
}
