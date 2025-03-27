import 'package:background_downloader/data/repository/repository.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:workmanager/workmanager.dart';

class AppRepository implements Repository {
  @override
  void init() {
    Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
    Workmanager().registerOneOffTask("taskId", "taskName");
  }

  @override
  Future<void> processRequest(String request) async {
    // Lógica real (acceso a base de datos, llamada API, etc.).
    print('Procesando solicitud en segundo plano: $request');
  }
}

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    final localNotifications = FlutterLocalNotificationsPlugin();
    await localNotifications.initialize(
      const InitializationSettings(
        iOS: DarwinInitializationSettings(),
        android: AndroidInitializationSettings('app_icon'),
      ),
    );

    const notificationDetails = NotificationDetails(
      iOS: DarwinNotificationDetails(),
      android: AndroidNotificationDetails('channel_id', 'channel_name'),
    );

    // Notificación al iniciar
    await localNotifications.show(
      0,
      "Inicio de tarea",
      "La tarea está en ejecución",
      notificationDetails,
    );

    // Simula tiempo de ejecución de la tarea
    await Future.delayed(Duration(seconds: 5));

    // Notificación al finalizar
    await localNotifications.show(
      1,
      "Tarea completada",
      "La tarea ha finalizado exitosamente",
      notificationDetails,
    );

    return Future.value(true);
  });
}
