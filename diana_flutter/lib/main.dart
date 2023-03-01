
// import 'package:diana_flutter/Screens/prueba_screen.dart';
// import 'package:diana_flutter/Screens/home_screen.dart';
// import 'package:diana_flutter/Screens/counter_screen.dart';
// import 'package:diana_flutter/Screens/pantallas_screen.dart';
// import 'package:diana_flutter/Screens/PageViewNum.dart';
// import 'package:diana_flutter/Screens/ButtomNavigator_screen.dart';
// import 'package:diana_flutter/Screens/nuevo.dart';
import 'package:flutter/material.dart';
import 'package:diana_flutter/Screens/formulario_screen.dart';

void main(){
  runApp(const EcoSharing());
}

class EcoSharing extends StatelessWidget{
  const EcoSharing({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FormularioScreen (),
    );
  }
}

