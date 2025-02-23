import 'package:flutter/material.dart';

class TransationForme extends StatefulWidget {
  final void Function(String, double) onSubmit;
  TransationForme(this.onSubmit);

  @override
  State<TransationForme> createState() => _TransationFormeState();
}

class _TransationFormeState extends State<TransationForme> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm() {
    final Title = titleController.text;
    final value = double.parse(valueController.text);

    if(Title.isEmpty || value <=0){
      return;
    }

    widget.onSubmit(Title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(10),
        
        child: Column(
          
          children: [
            TextField(
              controller: titleController,
              onSubmitted: (_)=>_submitForm(),
              decoration: const InputDecoration(
                labelText: 'Titulo',
              ),
            ),
            TextField(
              controller: valueController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  onSubmitted: (_)=>_submitForm(),
              decoration: const InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            TextButton(
              onPressed: _submitForm,
              child: const Text(
                "Nova Transação",
                style: TextStyle(color: Colors.purple),
              ),
            )
          ],
        ),
      ),
    );
  }
}
