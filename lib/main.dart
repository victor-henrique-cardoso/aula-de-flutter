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
  final List<Transacao> _trasactions = [
   
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
    Navigator.of(context).pop();
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
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: const Text("despesas pessoais",
        style: TextStyle(
          color: Colors.white,
        ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
              onPressed: () => _opentransactionFormodal(context),
              icon: const Icon(Icons.add_box_outlined),
              color: Colors.white,
              )
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
            TransactionList( _trasactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _opentransactionFormodal(context),
        child: const Icon(Icons.add_box_outlined),
      ),
    );
  }
}
