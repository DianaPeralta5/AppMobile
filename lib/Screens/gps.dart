import 'package:flutter/material.dart';
import 'package:location/location.dart';

class GPSScreen extends StatefulWidget {
  const GPSScreen({super.key});

  @override
  State<GPSScreen> createState() => _GPSScreenState();
}

class _GPSScreenState extends State<GPSScreen> {
  String texto = 'No se ha obtenido la ubicación GPS';
  late Location _location;

  @override
  void initState() {
    _location = Location();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ubicación GPS'),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'notificaciones');
              },
              child: const SizedBox(
                  height: 50,
                  child: Center(child: Text('Volver a las notificaciones')))),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                obtenerUbicacionGPS();
              },
              child: const SizedBox(
                  height: 50, child: Center(child: Text('Obtener ubicación')))),
          const SizedBox(height: 40),
          Text(texto)
        ]));
  }

  Future<void> obtenerUbicacionGPS() async {
    // 1: Comprobamos si el servicio de GPS está activado:
    bool serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      // Si está desactivado, le pedimos que lo inicie
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        texto = 'El GPS está desactivado';
        setState(() {});
        return;
      }
    }

    // 2: Comprobamos si el usuario nos ha dado permiso para utilizar el GPS
    PermissionStatus permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      // Si no lo ha otorgado, se lo pedimos
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        texto = 'No se ha dado permiso para utilizar el GPS';
        setState(() {});
        return;
      }
    }

    // 3: Si todo es correcto, obtenemos la ubicación
    LocationData locationData = await _location.getLocation();
    texto =
        'Latitud: ${locationData.latitude} Longitud: ${locationData.longitude}';

    // 4: Recibujamos la pantalla cuando termine
    setState(() {});
  }
}