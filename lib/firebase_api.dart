import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  final _firebaseMessageing = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    await _firebaseMessageing.requestPermission();
    final fCmTOken = await _firebaseMessageing.getToken();
    print("Token : $fCmTOken");
//    FirebaseMessaging.onBackgroundMessage(handleBackgroundNotification);
  }

/* Future<void>  handleBackgroundNotification(RemoteMessage remoteMessage) async {
        print("Title :${remoteMessage.notification?.title}");
        print("Body :${remoteMessage.notification?.body}");
        print("Payload :${remoteMessage.data}");
  }*/

}
