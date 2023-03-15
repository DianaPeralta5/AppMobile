import 'dart:convert';
import 'dart:math';
import 'package:formulario/Providers/db_provider.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:location/location.dart';
import 'package:formulario/Providers/notification_provider.dart';
import 'package:formulario/Screens/gps.dart';


class PantallaDatos extends StatefulWidget {
  const PantallaDatos({super.key});

  @override
  _PantallaDatos createState() => _PantallaDatos();
}
String apiKey = 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJkcGVyYWx0amFsQGVkdWNhY2lvbi5uYXZhcnJhLmVzIiwianRpIjoiMWE0YjY2NDEtNjVjNi00NWExLWFiMWMtMjk4NWM4YjRlMDdjIiwiaXNzIjoiQUVNRVQiLCJpYXQiOjE2Nzg2NjI4NDcsInVzZXJJZCI6IjFhNGI2NjQxLTY1YzYtNDVhMS1hYjFjLTI5ODVjOGI0ZTA3YyIsInJvbGUiOiIifQ.iPFdPCeSpFubKj_17FPyJLbPNhbSmtEFrEkik7498K0';
late Location _location;
double latitud = 0.0;
double longitud = 0.0;

double WBGTString = 0.0;
var result = "";


Color color = Colors.white;
int inten = 0;
int resultado = 0;
String riesgo = "";
final Map<String, int> habitos = {
    'ligero' : 30,
    'moderado' : 28,
    'activa' : 26,
    'muy': 25
  };


int temperatura = 0;
int humedad = 0;
String riesgoString = "";
final Map<String, List<String>> riesgoAct = {
    'bajo': ['Puedes desarollar tu actividad laboral sin preocuparte'],
    'medio': ['Intenta desarrollar tu actividad sin exigirte demasiado'],
    'alto': ['Evitar realizar las tareas pesadas en las horas de más calor, de 12:00 a 17:00, y en solitario.', 'Adaptar el ritmo de trabajo según la tolerancia al calor.', 'Descansar en lugares frescos.'],
    'extremo': ['PARAR la actividad al sentir calambres, mareos, fatiga, nauseas.', 'Retirarse a un lugar fresco y comunicar la situación a un compañero o superior.', 'Si los síntomas persisten avisar al 112.']
  };
class _PantallaDatos extends State<PantallaDatos> {
  
  @override
  Widget build(BuildContext context) {
    getNotificacion();
    ObtenerDatos();
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/logo.png', height: 45),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  child: const Text(
                    'INIZA Home', 
                    style: TextStyle(
                      fontSize: 20, 
                    )
                  ),
                ),
                const SizedBox(height: 10),
                Container(
            padding: EdgeInsets.all(10),
            child: Container(
              child: Text(
                riesgo.toString(),
	              textAlign: TextAlign.center,
              ),
              color: color,
            ),
        ),
        const Text(
                          'Extremar el cumplimiento de las medidas preventivas frente a las altas temperaturas',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                              fontStyle: FontStyle.italic)),
                      const Text('Organizar el trabajo:',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16)),
                      const Text(
                          '• Evitar realizar las tareas pesadas en las horas de más calor, de 12:00 a 17:00, y en solitario.',
                          textAlign: TextAlign.left),
                      const Text(
                          '• Adaptar el ritmo de trabajo según la tolerancia al calor.',
                          textAlign: TextAlign.left),
                      const Text('• Descansar en lugares frescos.'),
                      const Text('Hidratarse:',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16)),
                      const Text(
                        '• Beber abundante agua, o bebidas con sales, sin esperar a tener sed.',
                        textAlign: TextAlign.left,
                      ),
                      const Text('• Evitar bebidas con cafeína o azucaradas.',
                          textAlign: TextAlign.left),
                      const Text(
                          'Protegerse del sol y las temperaturas extremas:',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16)),
                      const Text(
                          '• Usar ropa ligera, viseras o sombreros, gafas de sol y crema solar.',
                          textAlign: TextAlign.left),
                      const Text(
                          '• Refrescarse mientras se trabaja o, si fuera necesario, ducharse, en especial al finalizar la jornada.',
                          textAlign: TextAlign.left),
                      const Text('Anticiparse al golpe de calor:',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16)),
                      const Text(
                          '• Parar la actividad al sentir calambres, mareos, fatiga, nauseas.',
                          textAlign: TextAlign.left),
                      const Text(
                          '• Retirarse a un lugar fresco y comunicar la situación a un compañero o superior.',
                          textAlign: TextAlign.left),
                      const Text('Si los síntomas persisten avisar al 112.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.red)),
      ]
      ))))

    );  
  }


  void getNotificacion() async {
    String mensaje = "HOLI :)";
        await NotificationProvider.notificationProvider.setup();
        NotificationProvider.notificationProvider.mostrarNotificacion(mensaje);
  }

  Future<int> sacarCodMunicipio() async {
    await GPSScreen.obtenerUbicacionGPS();
    var municipio;
    double distanciaMin = double.maxFinite;
    String jsonString =
        await rootBundle.loadString('assets/datosMunicipios.json');
    Map<String, dynamic> datos = json.decode(jsonString);

    for (int i = 0; i < datos['municipios'].length; i++) {
      var queMunicipio = datos['municipios'][i];
      double latitudJson = double.parse(queMunicipio['LATITUD']);
      double longitudJson = double.parse(queMunicipio['LONGITUD']);

      double distancia = sqrt(pow((latitudJson - latitud), 2)  + pow((longitudJson - longitud), 2));
      if (distancia < distanciaMin) {
        distanciaMin = distancia;
        municipio = datos['municipios'][i];
      }
      
    var pro = municipio['CPRO'];
    var mun = municipio['CMUN'];
    String result = pro + mun;
    resultado = int.parse(result);
    }
    return resultado;
  }



Future<String> ConexionAemet () async {
    int pamplona = 31201;//////////////////////////////////////////////
    String aemet ='https://opendata.aemet.es/opendata/api/prediccion/especifica/municipio/diaria/' + pamplona.toString() + '/?api_key=' + apiKey +'';
    
    final response = await http.get(Uri.parse(aemet));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      String urlAemet = jsonData['datos'];
      return urlAemet;
    } 
    else if(response.statusCode == 404){
      throw Exception('Municipio no encontrado');
      result = 'Municipio no encontrado';
    }
    else if(response.statusCode == 429){
      throw Exception('Too Many Requests');
      result = 'Too Many Requests';
    }
    else{
      throw Exception('Nono');
      result = 'Nono';
    }
  }

  Future<void> ObtenerDatos() async {
    var codMunicipio = await sacarCodMunicipio();

    if (codMunicipio != 0) {
      String url ='https://opendata.aemet.es/opendata/api/prediccion/especifica/municipio/diaria/' + codMunicipio.toString() + '/?api_key=' + apiKey +'';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final datos = json.decode(response.body);
        String urlAemet = datos['datos'];
        var url = Uri.parse(urlAemet);
        Response datosR = await http.get(url);
        final datos2 = json.decode(datosR.body);
        var sacarDia = datos2[0]['prediccion']['dia'];
        var temperaturas = sacarDia[0]['temperatura'];
        var temperatura = temperaturas['maxima'];
        var humedadesRelativas = sacarDia[0]['humedadRelativa'];
        var humedad = humedadesRelativas['maxima'];

        result = "$temperatura,$humedad";
      }
    }
    await WBGT();
  }

  Future<void> WBGT() async {
    String result = await ConexionAemet();
    if (result != "Municipio no encontrado" || result != "Too Many Requests" || result != 'Nono') {
      await ObtenerDatos();
      List<String> temperaturaHumedad = result.split(",");
        temperatura = int.parse(temperaturaHumedad[0]);
        humedad = int.parse(temperaturaHumedad[1]);

      double num = humedad / 100 * 6.105 * exp(17.27 * temperatura / (237.7 + temperatura));
      WBGTString = 0.567 * temperatura + 0.393 * num + 3.94;
    }
    String intensidad = await DBProvider.db.getHabitos();
    for (int i = 0; i < habitos.length; i++) {
             if(habitos[i].toString() == intensidad){
                inten = i;
                break;
            }
        }

    double diferencia = habitos[inten]! - WBGTString;
        color = Colors.green;
        if (diferencia < 0) {
          riesgo = 'extremo';
          color = Colors.red;
        } else if (diferencia > 0 && diferencia <= 3) {
          riesgo = 'alto';
          color = Colors.orange;
        } else if (diferencia > 3 && diferencia <= 6) {
          riesgo = 'medio';
          color = Colors.yellow;
        } else if (diferencia > 6) {
          riesgo = 'bajo';
          color = Colors.green;
        }
      
    for (int i = 0; i < riesgoAct.length; i++) {
             if(riesgoAct[i].toString() == riesgo){
                riesgoString = riesgoAct[i].toString();
                break;
            }
        }
  }
  }


