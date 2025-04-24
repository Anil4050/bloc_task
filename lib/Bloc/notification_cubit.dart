import 'package:api_calling/Services/localnotification_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationCubit extends Cubit<RemoteMessage> {
  NotificationCubit() : super(RemoteMessage()) {
    _initFCM();
  }

  void _initFCM() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    await messaging.requestPermission();

    final token = await messaging.getToken();
    print("FCM Token: $token");

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      emit(message);
      _handleNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      emit(message);
      _handleNotification(message);
    });
  }

  void _handleNotification(RemoteMessage message) {
    emit(message);

    final notification = message.notification;
    if (notification != null) {
      NotificationService.showNotification(
        title: notification.title ?? "No Title",
        body: notification.body ?? "No Body",
      );
    }
  }
}
