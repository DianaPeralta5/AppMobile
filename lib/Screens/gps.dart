import 'package:flutter/material.dart';
import 'package:location/location.dart';

class GPSScreen{

  static Future<String> obtenerUbicacionGPS() async {
    try {
      String texto = '';
      Location _location = Location();
      // 1: Comprobamos si el servicio de GPS está activado:
      bool serviceEnabled = await _location.serviceEnabled();
      if (!serviceEnabled) {
        // Si está desactivado, le pedimos que lo inicie
        serviceEnabled = await _location.requestService();
        if (!serviceEnabled) {
          texto = 'El GPS está desactivado';
          // setState(() {});
          return texto;
        }
      }

      // 2: Comprobamos si el usuario nos ha dado permiso para utilizar el GPS
      PermissionStatus permissionGranted = await _location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        // Si no lo ha otorgado, se lo pedimos
        permissionGranted = await _location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          texto = 'No se ha dado permiso para utilizar el GPS';
          // setState(() {});
          return texto;
        }
      }

      // 3: Si todo es correcto, obtenemos la ubicación
      LocationData locationData = await _location.getLocation();
      texto =
          '${locationData.latitude}*${locationData.longitude}';

      return texto;
    } catch (e) {
      return 'Error al obtener ubicacion';
    }
  }

  
}