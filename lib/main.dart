import 'package:despesa/modes/transacao.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

class Myhomepage extends StatelessWidget {
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

  Myhomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("despesas pessoais"),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: const Card(
                color: Colors.blue,
                child: Text('Crafico'),
                elevation: 10,
              ),
            ),
            Column(
              children: _trasactions.map((tr) {
                return Card(
                  elevation: 15,
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.purple,
                          width: 2,
                        )
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Text(

                        "R\$ ${ tr.value.toStringAsFixed(2)}" ,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            tr.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            DateFormat('d/mm/y').format(tr.date),
                            style: const TextStyle(
                              
                              color: Colors.grey

                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
             Card(
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Titulo',
                      ),
                    ),
                    const TextField(
                       decoration: InputDecoration(
                        labelText: 'Valor (R\$)',
                      ),
                    ),
                    TextButton(onPressed: (){}, child: const Text("Nova Transação",
                      style: TextStyle(
                        color: Colors.purple
                      ),
                    ),
                    )
                  ],
                ),
              ),
            )

          ],
        ));
  }
}
