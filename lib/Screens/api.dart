import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';



Future<String> ConexionAemet (int pamplona) async {
    String apiKey = 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJkcGVyYWx0amFsQGVkdWNhY2lvbi5uYXZhcnJhLmVzIiwianRpIjoiMWE0YjY2NDEtNjVjNi00NWExLWFiMWMtMjk4NWM4YjRlMDdjIiwiaXNzIjoiQUVNRVQiLCJpYXQiOjE2Nzg2NjI4NDcsInVzZXJJZCI6IjFhNGI2NjQxLTY1YzYtNDVhMS1hYjFjLTI5ODVjOGI0ZTA3YyIsInJvbGUiOiIifQ.iPFdPCeSpFubKj_17FPyJLbPNhbSmtEFrEkik7498K0';
    pamplona = 31201;//////////////////////////////////////////////
    String aemet = 'https://opendata.aemet.es/opendata/api/prediccion/especifica/municipio/horaria/' + pamplona.toString() + '/?api_key=' + apiKey;
    
    final response = await http.get(Uri.parse(aemet));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      String urlAemet = jsonData['datos'];
      return urlAemet;
    } 
    else if(response.statusCode == 404){
      throw Exception('Municipio no encontrado');
    }
    else if(response.statusCode == 429){
      throw Exception('Too Many Requests');
    }
    else{
      throw Exception('Nono');
    }
  }