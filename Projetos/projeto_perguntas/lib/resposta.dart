import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {

  final String texto;
  final void Function() quandoSelecionado;



  // ignore: use_key_in_widget_constructors
  const Resposta(this.texto, this.quandoSelecionado);


  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.blue,
        onPressed: quandoSelecionado,
        child: Text(texto),
      ),
    );
  }
}