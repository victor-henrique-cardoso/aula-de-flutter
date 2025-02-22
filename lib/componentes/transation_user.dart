import 'dart:math';

import 'package:despesa/modes/transacao.dart';
import 'package:flutter/material.dart';
import 'transation_forme.dart';
import 'transation_List.dart';

class TransationUser extends StatefulWidget {
  const TransationUser({super.key});

  @override
  State<TransationUser> createState() => _TransationUserState();
}

class _TransationUserState extends State<TransationUser> {
  final _trasactions = [
    Transacao(
      id: 't1',
      title: 'Novo tênis de corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
    Transacao(
      id: 't2',
      title: 'Conta de luz',
      value: 200,
      date: DateTime.now(),
    ),
  ];

  _addTransaction(String title, double value) {
    final newTransaction =
        Transacao(id: Random().nextDouble().toString(), title: title, value: value, date: DateTime.now());

        setState(() {
         _trasactions.add(newTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransationList(transation: _trasactions),
        TransationForme(_addTransaction),
      ],
    );
  }
}
