import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  NewTransaction(this.addTx);
  
  void submitData(){

    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);


    addTx(
      enteredTitle,
      enteredAmount,
    );
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
                       onSubmitted:(_) =>  submitData(),
                       ),
                       //.//
                      TextField(decoration:InputDecoration(labelText:'Amount'),
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      onSubmitted:(_) =>  submitData(),
                      //onChanged: (val) => amountInput = val,
                      ),
                   TextButton
                       (child: Text('Add Transaction'),
                       onPressed: submitData,
                      style: TextButton.styleFrom(primary: Colors.indigo),
                      ),
                    ]
                  ),
                ),
              );
  }
}