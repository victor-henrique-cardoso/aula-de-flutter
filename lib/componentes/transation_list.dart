import 'package:flutter/material.dart';
import '../modes/transacao.dart';
import 'package:intl/intl.dart';

class TransationList extends StatelessWidget {
  const TransationList({super.key, required this.transation});

  final List<Transacao> transation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transation.map((tr) {
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
                )),
                padding: const EdgeInsets.all(10),
                child: Text(
                  "R\$ ${tr.value.toStringAsFixed(2)}",
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
                    style: const TextStyle(color: Colors.grey),
                  )
                ],
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
