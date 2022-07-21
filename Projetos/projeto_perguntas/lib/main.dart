import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(PerguntaApp());
}


class PerguntaApp extends StatelessWidget {
  
@override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Perguntas'),
          ),
          body: Text('Olá flutter !!!'),
      ),
    );
  }

}