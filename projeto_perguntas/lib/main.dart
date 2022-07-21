
import 'package:flutter/material.dart';

void main() => runApp(const PerguntaApp());

class PerguntaAppState extends State<PerguntaApp> {
 
  var perguntaSelecionada = 0;
  void responder() {
    // ignore: avoid_print
    
    setState(() {
      perguntaSelecionada++;
    });

    print(perguntaSelecionada);
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
            Text(perguntas[perguntaSelecionada]),
            ElevatedButton(
              child: const Text('Resposta 1'),
              onPressed: responder,
            ),
            ElevatedButton(
              child: const Text('Resposta 2'),
              // ignore: duplicate_ignore
              onPressed: responder,
            ),
            ElevatedButton(
              child: const Text('Resposta 3'),
              onPressed: responder,
            ),
            ElevatedButton(
              child: const Text('Resposta 4'),
              onPressed: responder,
            )                                                         
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  PerguntaAppState createState() {
    return PerguntaAppState();
  }
}
