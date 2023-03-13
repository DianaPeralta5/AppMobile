import 'dart:io';

import 'package:formulario/Screens/form.dart';
import 'package:formulario/models/user_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  Future<Database> initDB() async {
    // Path de donde almacenaremos la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'TestDB.db');

    // Crear base de datos
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE Users(
            id INTEGER PRIMARY KEY,
            nombre TEXT,
            apellidos TEXT,
            email TEXT,
            contrasena TEXT,
            tipo TEXT
          )
        ''');
    });
  }

  Future<int> nuevoUserRaw(UserModel nuevoUser) async {
    final id = nuevoUser.id;
    final nombre = nuevoUser.nombre;
    final edad = nuevoUser.edad;
    final sexo = nuevoUser.sexo;
    final peso = nuevoUser.peso;
    final altura = nuevoUser.altura;
    final patologia = nuevoUser.patologia;
    final farmaco = nuevoUser.farmaco;
    final habitos = nuevoUser.habitos;
    // final embarazo = nuevoUser.embarazo;

    // Verificar la base de datos
    final db = await database;

    final res = await db!.rawInsert('''
      INSERT INTO Users( id, nombre, apellidos, email, contrasena, tipo )
        VALUES( $id, '$nombre', '$edad', '$sexo', '$peso', '$altura', '$patologia', '$farmaco', '$habitos')
    ''');

    return res;
  }

  Future<int> nuevoUser(UserModel nuevoUser) async {
    final db = await database;
    final res = await db!.insert('Users', nuevoUser.toJson());

    // *Es el ID del último registro insertado;
    print('NUEVO USUARIO: {$res}');
    return res;
  }

  Future<UserModel?> getUserById(int id) async {
    final db = await database;
    final res = await db!.query('Users', where: 'id = ?', whereArgs: [id]);

    return res.isNotEmpty ? UserModel.fromJson(res.first) : null;
  }

  Future<bool> getTodosLosUsers() async {
    final db = await database;
    final res = await db!.query('Users');

    print(res.isNotEmpty ? true : false);
    return res.isNotEmpty ? true : false;
  }

  Future<int> updateUser(UserModel nuevoUser) async {
    final db = await database;
    final res = await db!.update('Users', nuevoUser.toJson(),
        where: 'id = ?', whereArgs: [nuevoUser.id]);
    return res;
  }

  Future<int> deleteUser(int id) async {
    final db = await database;
    final res = await db!.delete('Users', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAllUsers() async {
    final db = await database;
    final res = await db!.rawDelete('''
      DELETE FROM Users    
    ''');

    print('Se han borrado todos los Usuarios');
    return res;
  }
}