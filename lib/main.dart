import 'package:despesa/componentes/transation_user.dart';

import 'package:flutter/material.dart';

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
//parei na aula 102 começar a aula 103
class Myhomepage extends StatelessWidget {
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
            TransationUser(),
          ],
        ));
  }
}
