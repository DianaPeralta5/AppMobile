import 'package:flutter/material.dart';

class FormularioScreen extends StatelessWidget {
  const FormularioScreen({super.key});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.white,
          title: Image.asset(
            'assets/logo.jpg',
            height: 45,
          ),
          centerTitle: true,          
        ),
        body: const Formulario(),
    );
  }
}

enum SingingCharacter { hombre, mujer}

class Formulario extends StatefulWidget {
  const Formulario({super.key});

 @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario>{
     SingingCharacter? _character = SingingCharacter.hombre;
  formItemsDesign(icon, item) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7),
      child: Card(child: ListTile(leading: Icon(icon), title: item)),
    );
  }

  @override
  Widget build(BuildContext context) {
     return  Column(
     children: <Widget>[
        Container(
          child: Padding(
            padding: EdgeInsets.only (
                    top: 30.0,
                    bottom: 20.0
                  ),
            child: Text(
              'Formulario de registro',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0
              ),
            ),
          ),
        ),
       formItemsDesign(
           Icons.person,
           TextFormField(
             decoration: new InputDecoration(
               labelText: 'Nombre y Apellidos',
             ),
           ),
          ),
          formItemsDesign(
           Icons.calendar_month,
           TextFormField(
             decoration: new InputDecoration(
               labelText: 'Edad',
             ),
           ),
          ),
          Container(
            child: Text(
              "Sexo: ",
              style: const TextStyle(fontWeight: FontWeight.bold)
          ),
          ),
          ListTile(
          title: const Text('Hombre'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.hombre,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Mujer'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.mujer,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        formItemsDesign(
           Icons.accessibility_new_rounded,
           TextFormField(
             decoration: new InputDecoration(
               labelText: 'Peso',
             ),
           ),
          ),
        formItemsDesign(
           Icons.accessibility_new_rounded,
           TextFormField(
             decoration: new InputDecoration(
               labelText: 'Altura',
             ),
           ),
          ),
        Container(
                child:ButtonBar(
                  alignment: MainAxisAlignment.center,
                  buttonPadding:EdgeInsets.symmetric(
                   horizontal: 10,
                   vertical: 10
                ),
              children: [
                ElevatedButton(
                  child: Text("Siguiente"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlue,
                    minimumSize: Size(500, 40),
                  ),
                  onPressed: () => {
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Formulario2Screen()),
                    ),
                  },
                ),
              ]
              ),
              ),
     ]
     );   
  }
}


class Formulario2Screen extends StatelessWidget {
  const Formulario2Screen({super.key});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.white,
          title: Image.asset(
            'assets/logo.jpg',
            height: 45,
          ),
          centerTitle: true,          
        ),
        body: const Formulario2(),
    );
  }
}

enum patologia { si, no, nada}
enum farmaco { si, no, nada}

class Formulario2 extends StatefulWidget {
  const Formulario2({super.key});

 @override
  State<Formulario2> createState() => _Formulario2State();
}

class _Formulario2State extends State<Formulario2>{
     farmaco? _farmaco = farmaco.no;
     patologia? _patologia = patologia.no;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: <Widget>[
        Container(
          child: Padding(
            padding: EdgeInsets.only (
              top: 30.0,
              bottom: 20.0
            ),
            child: Text(
              'Formulario de registro',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0
              ),
            ),
            
          ),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.only (
              top: 20.0,
              bottom: 5.0
            ),
            child: Text(
              '¿Tomas algún farmaco a considerar?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0
              ),
            ),
          ),
        ),
        ListTile(
          title: const Text('Si'),
          leading: Radio<farmaco>(
            value: farmaco.si,
            groupValue: _farmaco,
            onChanged: (farmaco? value) {
              setState(() {
                _farmaco = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('No'),
          leading: Radio<farmaco>(
            value: farmaco.no,
            groupValue: _farmaco,
            onChanged: (farmaco? value) {
              setState(() {
                _farmaco = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Nada a considerar'),
          leading: Radio<farmaco>(
            value: farmaco.nada,
            groupValue: _farmaco,
            onChanged: (farmaco? value) {
              setState(() {
                _farmaco = value;
              });
            },
          ),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.only (
              top: 20.0,
              bottom: 5.0
            ),
            child: Text(
              '¿Tiene alguna patologia a considerar?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0
              ),
            ),
          ),
        ),
        ListTile(
          title: const Text('Si'),
          leading: Radio<patologia>(
            value: patologia.si,
            groupValue: _patologia,
            onChanged: (patologia? value) {
              setState(() {
                _patologia = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('No'),
          leading: Radio<patologia>(
            value: patologia.no,
            groupValue: _patologia,
            onChanged: (patologia? value) {
              setState(() {
                _patologia = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Nada a considerar'),
          leading: Radio<patologia>(
            value: patologia.nada,
            groupValue: _patologia,
            onChanged: (patologia? value) {
              setState(() {
                _patologia = value;
              });
            },
          ),
        ),
        Container(
                child:ButtonBar(
                  alignment: MainAxisAlignment.center,
                  buttonPadding:EdgeInsets.symmetric(
                   horizontal: 10,
                   vertical: 10
                ),
              children: [
                ElevatedButton(
                  child: Text("Siguiente"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlue,
                    minimumSize: Size(500, 40),
                  ),
                  onPressed: () => {
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Formulario2Screen()),
                    ),
                  },
                ),
              ]
              ),
              ),
     ]
     );   
  }
}



  class BienvenidoScreen extends StatelessWidget { 
  const BienvenidoScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.white,
          title: Image.asset(
            'assets/logo.jpg',
            height: 45,
          ),
          centerTitle: true,          
        ),
        body: Column(
          children: <Widget>[
            Container(
                    child: Padding(
                  padding: EdgeInsets.only (
                    top: 100.0,
                    left: 20.0,
                    right: 10.0
                  ),
                  child:  Text(
                    'REGISTRO DE USUARIO',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0
                      ),
                  ),
                ),
              ),
            Container(
                    child: Padding(
                  padding: EdgeInsets.only (
                    top: 30.0,
                    left: 20.0,
                    right: 10.0,
                    bottom: 10.0
                  ),
                  child:  Text(
                    'Bienvenid@ al proyecto INIZA \n \nEl objetivo de esta aplicación es evitar la aparición de daños en la salud de los trabajadores comoo consecuencia de la exposición a situaciones de estrés térmico durante la jornada laboral.\n \nAl finalizar el formulario debe poder recibir consejos preventivos ajustados a las caracteristicas que se hayan dado previamente',
                  ),
                ),
              ),
            Container(
                child:ButtonBar(
                  alignment: MainAxisAlignment.center,
                  buttonPadding:EdgeInsets.symmetric(
                   horizontal: 10,
                   vertical: 10
                ),
              children: [
                ElevatedButton(
                  child: Text("Iniciar registro"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlue,
                    minimumSize: Size(500, 40),
                  ),
                  onPressed: () => {
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FormularioScreen()),
                    ),
                  },
                ),
              ]
              ),
              ),
            Container(
                    child: Padding(
                  padding: EdgeInsets.only (
                    top: 220.0,
                    left: 20.0,
                    right: 10.0,
                  ),
                  child:  
                    Text(
                    '*NO SE PRETENDE QUE LA APLICACIÓN RECOLECTE INFORMACION ACERCA DE LAS CARATERISTICAS DE LOS USUARIO PARA NINGUNA EXPLOTACION COMERCIAL DE LOS MISMOS*',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10.0
                    )
                  ),
                ),
              )
            ],
        )
    );
   }
}



