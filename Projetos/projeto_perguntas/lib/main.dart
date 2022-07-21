// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(PerguntaApp());
}


class PerguntaApp extends StatelessWidget {
  
void responder(){
  print('Pergunta Respondida');
}


@override
  Widget build(BuildContext context) {

    final List<String> perguntas = [
      'Qual é a sua cor favorita',
      'Qual é o seu animal favorito'
    ];

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Perguntas'),
          ),
          body: Column(
            children: [
              Text(perguntas[0]),
              RaisedButton(
                child: Text('Resposta 1'),
                onPressed: responder,
              ),
              RaisedButton(
                child: Text('Resposta 2'),
                onPressed:   () { print('Resposta 2 foi selecionada');},
              ),
              RaisedButton(
                child: Text('Resposta 3'),
                onPressed: () => print('Resposta 3'),
              ),                            
            ],
          ),
      ),
    );
  }

}