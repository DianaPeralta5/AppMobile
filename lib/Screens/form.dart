import 'package:flutter/material.dart';
import 'package:formulario/widgets/custom_input_field.dart';
import 'package:formulario/models/user_model.dart';
import 'package:formulario/providers/db_provider.dart';
import 'package:formulario/widgets/custom_input_field.dart';

final GlobalKey<FormState> UsuarioKey = GlobalKey<FormState>();

final Map<String, String> datosUsuario = {
      'nombre': '',
      'edad': '',
      'sexo': '',
      'embarazo': '',
      'peso': '',
      'altura': '',
      'patologia': '',
      'farmaco': '',
      'actividad': '',
      'habitos': ''
    };
class FormularioScreen extends StatefulWidget {
  const FormularioScreen({super.key});

 @override
  State<StatefulWidget> createState() {
    return FormularioState();
  }
}

enum SingingCharacter { hombre, mujer}
class FormularioState extends State<StatefulWidget>{
    SingingCharacter? _character = SingingCharacter.hombre;
    
  @override
  Widget build(BuildContext context) {
    datosUsuario['sexo'] = 'hombre';    
    formItemsDesign(icon, item) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 7),
        child: Card(child: ListTile(leading: Icon(icon), title: item)),
      );
    }
     return  Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.white,
          title: Image.asset(
            'assets/logo.jpg',
            height: 45,
          ),
          centerTitle: true,          
        ),
      body: SingleChildScrollView(
        child: Column(
        children: <Widget>[
        Container(
          child: const Padding(
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
          child: Form(
            key: UsuarioKey,
            child: Column(
              children: [
                formItemsDesign(
                  Icons.person,
                  CustomInputField(
                    labelText: 'Nombre y Apellidos',
                    hintText: '',
                    formProperty: 'nombre',
                    formValues: datosUsuario,
                    min: 4,
                    obligatorio: true,
                  ),
                ),
                formItemsDesign(
                  Icons.calendar_month,
                  CustomInputField(
                    labelText: 'Edad',
                    hintText: '',
                    formProperty: 'edad',
                    formValues: datosUsuario,
                    min: 1,
                    obligatorio: true,
                  ),
                ),
                Container(
                  child: const Text(
                    "Sexo: ",
                    style: TextStyle(fontWeight: FontWeight.bold)
                  ),
                ),
                ListTile(
                  title: const Text('Hombre'),
                  leading: Radio<SingingCharacter>(
                    value: SingingCharacter.hombre,
                    groupValue: _character,
                    onChanged: (value) {
                      datosUsuario['sexo'] = 'Hombre';
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
                    onChanged: (value) {
                      datosUsuario['sexo'] = 'Mujer';
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  child: const Text(
                    "Embarazo: ",
                    style: TextStyle(fontWeight: FontWeight.bold)
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: DropdownButtonFormField<String>(
                        value: 'Si',
                        items: const [
                          DropdownMenuItem(value: 'Si', child: Text('Si')),
                          DropdownMenuItem(value: 'No', child: Text('No')),
                        ],
                        onChanged: (value) {
                        datosUsuario['embarazo'] = datosUsuario['embarazo'] == ""  ? 'Si' : value!;
                        }),
                  ),
                ),
                formItemsDesign(
                  Icons.accessibility_new_rounded,
                  CustomInputField(
                    labelText: 'Peso',
                    hintText: '',
                    formProperty: 'peso',
                    formValues: datosUsuario,
                    min: 2,
                    obligatorio: true,
                  ),
                ),
                formItemsDesign(
                  Icons.accessibility_new_rounded,
                  CustomInputField(
                    labelText: 'Altura',
                    hintText: '',
                    formProperty: 'altura',
                    formValues: datosUsuario,
                    min: 2,
                    obligatorio: true,
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
              ],
            )
          ),
        )
      ]
    ),
      )
  );   
  }
}


class Formulario2Screen extends StatefulWidget {
  const Formulario2Screen({super.key});

 @override
  State<StatefulWidget> createState() {
    return _Formulario2State();
  }
}

enum patologia { si, no, nada}
enum farmaco { si, no, nada}
class _Formulario2State extends State<Formulario2Screen>{
     farmaco? _farmaco = farmaco.no;
     patologia? _patologia = patologia.no;
  @override
  Widget build(BuildContext context) {
    datosUsuario['farmaco'] = 'no';
    datosUsuario['patologia'] = 'no';
    return  Scaffold(
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
            onChanged: (value) {
              datosUsuario['farmaco'] = 'si';
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
            onChanged: (value) {
              datosUsuario['farmaco'] = 'no';
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
            onChanged: (value) {
              datosUsuario['farmaco'] = 'no';
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
            onChanged: (value) {
                datosUsuario['patologia'] = 'si';
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
            onChanged: (value) {
                datosUsuario['patologia'] = 'no';
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
            onChanged: (value) {
                datosUsuario['patologia'] = 'no';
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
                     MaterialPageRoute(builder: (context) => Formulario3Screen()),
                  ),
                },
              ),
            ]
          ),
        ),
      ]
     )
    );   
  }
}


class Formulario3Screen extends StatefulWidget {
  const Formulario3Screen({super.key});

  @override
  State<StatefulWidget> createState() {
    return Formulario3();
  }
}

enum habitos { ligera, moderada, activa, muy}
class Formulario3 extends State<StatefulWidget>{
     habitos? _habitos = habitos.activa;
  @override
  Widget build(BuildContext context) {
    datosUsuario['habitos'] = 'activa';
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
                  child: const Text(
                    "Selector de Actividad: ",
                    style: TextStyle(fontWeight: FontWeight.bold)
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child:  DropdownButtonFormField<String>(
                      value: 'Agricultura',
                      items: const [
                        DropdownMenuItem(
                            value: 'Agricultura', child: Text('Agricultura')),
                        DropdownMenuItem(
                            value: 'Industria', child: Text('Industria')),
                        DropdownMenuItem(
                            value: 'Construccion', child: Text('Construccion')),
                        DropdownMenuItem(
                            value: 'Servicios', child: Text('Servicios')),
                      ],
                      onChanged: (value) {
                        datosUsuario['actividad'] = datosUsuario['actividad'] == ""  ? 'Agricultura' : value!;
                      }),
                  ),
                ),
          Container(
            child: Padding(
              padding: EdgeInsets.only (
                top: 20.0,
                bottom: 5.0
              ),
              child: Text(
                '¿Como es tu actividad diaria?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text('Ligera'),
            leading: Radio<habitos>(
              value: habitos.ligera,
              groupValue: _habitos,
              onChanged: (value) {
                datosUsuario['habitos'] = 'ligera';
                setState(() {
                  _habitos = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Moderada'),
            leading: Radio<habitos>(
              value: habitos.moderada,
              groupValue: _habitos,
              onChanged: (value) {
                datosUsuario['habitos'] = 'moderada';
                setState(() {
                  _habitos = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Activa'),
            leading: Radio<habitos>(
              value: habitos.activa,
              groupValue: _habitos,
              onChanged: (value) {
                datosUsuario['habitos'] = 'activa';
                setState(() {
                  _habitos = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Muy activa'),
            leading: Radio<habitos>(
              value: habitos.muy,
              groupValue: _habitos,
              onChanged: (value) {
                datosUsuario['habitos'] = 'muy';
                setState(() {
                  _habitos = value;
                });
              },
            ),
          ),
          ElevatedButton(
            child: const SizedBox(
            width: double.infinity,
            child: Center(child: Text('Guardar'))),
            onPressed: () {
              if (!UsuarioKey.currentState!.validate()) {
                print('Formulario no válido');
                return;
              }
              UserModel user = UserModel(
                nombre: datosUsuario['nombre']!,
                edad: datosUsuario['edad']!,
                sexo: datosUsuario['sexo']!,
                embarazo: datosUsuario['embarazo']!,
                peso: datosUsuario['peso']!,
                altura: datosUsuario['altura']!,
                patologia: datosUsuario['patologia']!,
                farmaco: datosUsuario['farmaco']!,
                actividad: datosUsuario['actividad']!,
                habitos: datosUsuario['habitos']!
              );
              DBProvider.db.nuevoUser(user);
            },
          ),
          const SizedBox(height: 10),
                  ElevatedButton(
                    child: const SizedBox(
                        width: double.infinity,
                        child: Center(child: Text('Listar Usuarios'))),
                    onPressed: () {
                      //* Mostrar usuarios de la BD
                      DBProvider.db.getTodosLosUsers();
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      child: const SizedBox(
                          width: double.infinity,
                          child: Center(child: Text('Borrar Usuarios'))),
                      onPressed: () {
                        //* Borrar todos los usuarios de la BBDD
                        DBProvider.db.deleteAllUsers();
                      }),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        //! Navegamos a otra pantalla
                        // Poner una pantalla encima (ofrece volver a la pantalla anterior en el AppBar)
                        // Navigator.pushNamed(context, 'notificaciones');

                        // pushReplacement destruye el stack de pantallas anterior (no puedes volver)
                        Navigator.pushReplacementNamed(
                            context, 'notificaciones');
                      },
                      child: const SizedBox(
                          width: double.infinity,
                          child:
                              Center(child: Text('Pantalla Notificaciones')))),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'rest');
                      },
                      child: const SizedBox(
                          width: double.infinity,
                          child: Center(child: Text('REST'))))
        ]
     )
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