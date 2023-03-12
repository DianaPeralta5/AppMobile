import 'package:flutter/material.dart';
import 'Screens/form.dart';

void main() async {
  // Utilizado para las notificaciones, comprueba que esté todo inicializado
  WidgetsFlutterBinding.ensureInitialized();
  // Inicializamos las configuraciones iniciales de las notificaciones
  // await NotificationProvider.notificationProvider.setup();

  runApp(const Iniza());
}

class Iniza extends StatelessWidget {
  const Iniza({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const BienvenidoScreen(),
      // initialRoute: 'formulario',
      // //* Definimos las rutas de la aplicación para poder navegar de manera sencilla entre pantallas
      // routes: {
      //   'formulario': (context) => const FormDBScreen(),
      //   'notificaciones': (context) => const NotificacionesScreen(),
      //   'gps': (context) => const GPSScreen(),
      //   'rest': (context) => const RestScreen()
      // },
      // theme: CustomLightTheme.themeData,
    );
  }
}