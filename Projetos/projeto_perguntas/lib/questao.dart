import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  
  final String texto;

  // ignore: use_key_in_widget_constructors
  const Questao(this.texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      child: Text(
        texto,
        style: const TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}