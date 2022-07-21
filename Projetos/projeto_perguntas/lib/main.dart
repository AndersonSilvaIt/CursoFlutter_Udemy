// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
    
    print(_perguntaSelecionada);
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
            Text(perguntas[_perguntaSelecionada]),
            RaisedButton(
              child: Text('Resposta 1'),
              onPressed: _responder,
            ),
            RaisedButton(
              child: Text('Resposta 2'),
              onPressed: _responder,
            ),
            RaisedButton(
              child: Text('Resposta 3'),
              onPressed: _responder,
            ),
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
