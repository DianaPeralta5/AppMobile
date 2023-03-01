import 'package:flutter/material.dart';

class FormularioScreen extends StatelessWidget {
  const FormularioScreen({super.key});

 @override
  Widget build(BuildContext context) {
    const appTitle = 'Registro de usuario';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const Formulario(),
      ),
    );
  }
}

enum SingingCharacter { hombre, mujer, otro }

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
        ListTile(
          title: const Text('Otro'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.otro,
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
     ]
     );   
  }
}
