import 'dart:math';

import 'package:flutter/material.dart';
import './transaction_form.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class TransactionUser extends StatefulWidget {
  
  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  @override
  final _transactions = [
    Transaction(
        id: 't1',
        title: 'Novo Tênis de Corrida',
        value: 310.76,
        date: DateTime.now()),
    Transaction(
      id: 't2',
      title: 'Conta de Luz',
      value: 211.30,
      date: DateTime.now(),
    ),
        Transaction(
      id: 't3',
      title: 'Conta #01',
      value: 215.30,
      date: DateTime.now(),
    ),
        Transaction(
      id: 't4',
      title: 'Conta #02',
      value: 350.30,
      date: DateTime.now(),
    ),
            Transaction(
      id: 't5',
      title: 'Conta #03',
      value: 850.30,
      date: DateTime.now(),
    ),
  ];

_addTransaction(String title, double valuer){
  final newTransaction = Transaction(
    id: Random().nextDouble().toString(),
    title: title,
    value: valuer,
    date: DateTime.now(),
  );

  setState(() {
    _transactions.add(newTransaction);
  });
}

@override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionForm(_addTransaction),
        TransactionList(_transactions),
      ],
    );
  }
}
