import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tzData;

class NotificationProvider {
  // Utilizado como Singleton para usar una única instancia
  static final NotificationProvider notificationProvider =
      NotificationProvider._();
  NotificationProvider._();

  static int notificationID = 0;

  final _localNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> setup() async {
    const androidSetting = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initSettings = InitializationSettings(android: androidSetting);
    await _localNotificationsPlugin.initialize(initSettings).then((_) {
      debugPrint('setupPlugin: setup success');
    }).catchError((Object error) {
      debugPrint('Error: $error');
    });
  }

  Future<void> mostrarNotificacion() async {
    const AndroidNotificationDetails androidDetail = AndroidNotificationDetails(
      'your_channel_id', // ID del canal de notificación
      'your_channel_name', // Nombre del canal de notificación
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidDetail);
    await _localNotificationsPlugin.show(
      // Se va autoincrementando para permitir distintas notificaciones al mismo tiempo.
      //       Si queremos siempre la misma con poner un 0 basta
      notificationID++, // ID de la notificación
      'Título de la notificación: Exercitation anim nostrud laboris sit tempor mollit laborum eiusmod qui consectetur eu.', // Título de la notificación
      'Cuerpo de la notificación: Ipsum do adipisicing anim reprehenderit eu dolore aute minim laborum.', // Cuerpo de la notificación
      platformChannelSpecifics, // Detalles de la notificación
    );
  }
}