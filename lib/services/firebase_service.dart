import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseService {
  Future<String?> getToken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    // Request permission (important for iOS)
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      return await messaging.getToken();
    }
    return null;
  }
}
