import 'package:api_calling/Bloc/notification_cubit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
      ),
      body: BlocBuilder<NotificationCubit, RemoteMessage?>(
        builder: (context, message) {
          if (message != null) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('New Notification'),
                Text('title: ${message.notification?.title}'),
                Text('title: ${message.notification?.body}'),
              ],
            );
          } else {
            return Center(
              child: Text('waiting for message'),
            );
          }
        },
      ),
    );
  }
}
