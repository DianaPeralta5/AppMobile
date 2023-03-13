import 'package:flutter/material.dart';
import 'dart:convert';

UserModel scanModelFromJson(String str) => UserModel.fromJson(json.decode(str));
String scanModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel(
  {
    this.id,
    required this.nombre,
    required this.edad,
    required this.sexo,
    required this.peso,
    required this.altura,
    this.actividad = '',
    this.patologia = '',
    this.farmaco = '',
    this.habitos = '',
    // this.embarazo,
   });

  int? id;
  String nombre;  
  String edad;
  String sexo;
  String peso;
  String altura;
  String actividad; 
  String? patologia;
  String? farmaco;
  String? habitos;
  // bool? embarazo = false;
  
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    nombre: json["nombre"],
    edad: json["edad"],
    sexo: json["sexo"],
    peso: json["sexo"],
    altura: json["sexo"],
    patologia: json["patologia"],
    farmaco: json["farmaco"],
    habitos: json["habitos"],
    // embarazo: json["embarazo"],
  );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "edad": edad,
        "sexo": sexo,
        "peso": peso,
        "altura": altura,
        "actividad": actividad,
        "patologia": patologia,
        "farmaco": farmaco,
        "habitos": habitos
  };

  @override
  String toString() {
    String toString =
        'id: $id\nnombre: $nombre\naEdad: $edad\nSexo: $sexo\nPeso: $peso\naAltura: $altura\nNivel de actividad: $actividad\nPatologia: $patologia\Farmaco: $farmaco' + 
        '\nHabitos: $habitos';
    return toString;
  }
}