import 'package:despesa/componentes/transation_forme.dart';
import 'package:despesa/componentes/transation_user.dart';
import 'package:despesa/modes/transacao.dart';
import 'package:flutter/material.dart';
import 'componentes/transation_forme.dart';
import 'componentes/transation_list.dart';
import 'dart:math';

main() => runApp(Despesa());

class Despesa extends StatelessWidget {
  const Despesa({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Myhomepage(),
    );
  }
}

class Myhomepage extends StatefulWidget {
  Myhomepage({super.key});

  @override
  State<Myhomepage> createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
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
    final newTransaction = Transacao(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: DateTime.now());

    setState(() {
      _trasactions.add(newTransaction);
    });
  }

  _opentransactionFormodal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransationForme(_addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("despesas pessoais"),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(onPressed: ()=>_opentransactionFormodal(context),
          
           icon: const Icon(Icons.add_box_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: const Card(
                color: Colors.blue,
                child: Text('Crafico'),
                elevation: 10,
              ),
            ),
            TransationList(transation: _trasactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>_opentransactionFormodal(context),
        child: const Icon(Icons.add_box_outlined),
      ),
    );
  }
}
