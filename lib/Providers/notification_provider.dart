import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tzData;
import 'package:formulario/Screens/form.dart';


class NotificationProvider {
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

  Future<void> mostrarNotificacion(String mensaje) async {
    FormularioScreen pp = FormularioScreen();
    const AndroidNotificationDetails androidDetail = AndroidNotificationDetails(
      'your_channel_id', // ID del canal de notificación
      'your_channel_name', // Nombre del canal de notificación
      importance: Importance.max,
      priority: Priority.high,
    );
    if (mensaje != null) {
      const NotificationDetails platformChannelSpecifics =
          NotificationDetails(android: androidDetail);
      await _localNotificationsPlugin.show(
        notificationID++, // ID de la notificación
        'MENSAJE', // Título de la notificación
        mensaje, // Cuerpo de la notificación
        platformChannelSpecifics, // Detalles de la notificación
      );
    }
  }
}