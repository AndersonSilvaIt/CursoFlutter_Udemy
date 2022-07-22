import './questao.dart';
import './resposta.dart';

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  
  var _perguntaSelecionada = 0;

    final _perguntas = const [
      {
        'texto': 'Qual é a sua cor favorita?',
        'respostas' : ['Preto','Vermelho','Verde','Branco'],
      },
      { 
        'texto' : 'Qual é o seu animal favorito',
        'respostas' : ['Coelho','Cobra','Elefante','Leão'],
      },
      {
        'texto' : 'Qual seu instrutor favorito?',
        'respostas' : ['Maria','João','Leo','Pedro'],
      }
    ];

  void _responder() {
    if(temPerguntaSelecionada){
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {

//List<Map<String, Object>>

    List<String> respostas = temPerguntaSelecionada ? 
     _perguntas[_perguntaSelecionada].cast()['respostas'] 
     : [];
    /*List<Widget> widgets = respostas
          .map((t) => Resposta(t, _responder))
          .toList();
    */
    //for (String textoResp in respostas){
     //   widgets.add(Resposta(textoResp, _responder));
    //}

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada ? Column(
          children: [
            Questao(_perguntas[_perguntaSelecionada]['texto'].toString()),
           ...respostas.map((t) => Resposta(t, _responder)).toList(),
          ],
        ) : null,
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
