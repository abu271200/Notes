import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData(){

    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);


    widget.addTx(
      enteredTitle,
      enteredAmount,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
                elevation: 10,
                child: Container(
                  padding: EdgeInsets.all(10),
                   child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                    TextField(
                       decoration: InputDecoration(labelText:'Title'),
                       controller: titleController,
                       keyboardType: TextInputType.text,
                       onSubmitted: (_) => submitData,
                       ),
                      TextField(
                      decoration:InputDecoration(labelText:'Amount'),
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      onSubmitted: (_) =>  submitData,
                      //onChanged: (val) => amountInput = val,
                      ),
                   TextButton(
                       child: Text('Add Transaction'),
                       onPressed: submitData,
                      style: TextButton.styleFrom(primary: Colors.indigo),
                      ),
                    ]
                  ),
                ),
              );
  }
}