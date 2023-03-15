import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String formProperty;
  final Map<String, String> formValues;
  final bool obligatorio;
  final int min;

  const CustomInputField({
    Key? key,
    this.hintText,
    this.labelText,
    required this.formProperty,
    required this.formValues,
    required this.obligatorio,
    required this.min
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Function valor = (String value) {};
    if (obligatorio) {
      valor = (String value) {
        if (value == null) return 'Este campo es requerido';
          return value.length < min ? 'Se necesita un mínimo de ' + min.toString() + ' letras' : null;
      };
    }

    return TextFormField(
        autofocus: false,
        initialValue: '',
        textCapitalization: TextCapitalization.words,
        onChanged: (value) => formValues[formProperty] = value,
        validator: (value) => valor(value),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText
        ));
  }
}