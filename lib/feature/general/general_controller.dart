import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage? message) async {
  Logger().v(message?.data);
  if (message?.data["type"] == 'latest') {
    // Get.toNamed(Routes.JOBLIST, arguments: categoryData.first);
  }
}

class GeneralController extends GetxController {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  @override
  void onInit() {
    initFCM();
    super.onInit();
  }

  initFCM() async {
    String? token = await messaging.getToken();
    Logger().d(token ?? 'no fcm');

    FirebaseMessaging.onMessage.listen((RemoteMessage? message) {
      Logger().v(message?.data);
    });
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }
}
