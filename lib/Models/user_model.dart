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
    this.embarazo = '',
    required this.peso,
    required this.altura,
    this.patologia = ' ',
    this.farmaco = ' ',
    this.actividad = ' ',
    this.habitos = ' ',
   });

  int? id;
  String nombre;  
  String edad;
  String sexo;
  String embarazo;
  String peso;
  String altura;
  String? patologia;
  String? farmaco;
  String? actividad;
  String? habitos;
  
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    nombre: json["nombre"],
    edad: json["edad"],
    sexo: json["sexo"],
    embarazo: json["embarazo"],
    peso: json["sexo"],
    altura: json["sexo"],
    patologia: json["patologia"],
    farmaco: json["farmaco"],
    actividad: json["actividad"],
    habitos: json["habitos"],
  );
  

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "edad": edad,
        "sexo": sexo,
        "peso": peso,
        "embarazo": embarazo,
        "altura": altura,
        "patologia": patologia,
        "farmaco": farmaco,
        "actividad": actividad,
        "habitos": habitos
  };


  @override
  String toString() {
    String toString =
        'id: $id\nNombre: $nombre\naEdad: $edad\nSexo: $sexo\nEmbarazo: $embarazo\nPeso: $peso\naAltura: $altura\nPatologia: $patologia\nActividad: $actividad\nHabitos: $habitos';
    return toString;
  }
  
}