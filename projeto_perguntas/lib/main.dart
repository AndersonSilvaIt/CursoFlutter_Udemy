// ignore_for_file: avoid_print, duplicate_ignore

import 'package:flutter/material.dart';

void main() => runApp(PerguntaApp());


class PerguntaApp extends StatelessWidget {
  
  const PerguntaApp({Key? key}) : super(key: key);

  void responder() {
    // ignore: avoid_print
    print('Pergunta respondida');
  }

  void Function() funcaoQueRetornaUmaOutraFuncao() {
    return () {
      // ignore: avoid_print
      print('Pergunta Respondida Teste');
    };
  }

  @override
  Widget build(BuildContext context) {
    
    final perguntas = [
      'Qual é a sua cor favorita?',
      'Qual é o seu animal favorito?',
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: Column(
          children: <Widget>[
            Text(perguntas[0]),
            ElevatedButton(
              child: const Text('Resposta 1'),
              onPressed: funcaoQueRetornaUmaOutraFuncao(),
            ),
            ElevatedButton(
              child: const Text('Resposta 2'),
              // ignore: duplicate_ignore
              onPressed: () {
                // ignore: avoid_print
                print('Resposta 02 foi selecionada');
              },
            ),
            ElevatedButton(
              child: const Text('Resposta 3'),
              onPressed: responder,
            ),
            ElevatedButton(
              child: const Text('Resposta 4'),
              onPressed: () => print('Resposta 04'),
            )                                                         
          ],
        ),
      ),
    );
  }
}
