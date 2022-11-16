import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime ?_selectedDate;
    void _submitData(){
      if(_amountController.text.isEmpty){
        return;
      }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
   
    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );
    Navigator.of(context).pop();
  }
  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
        //..  DateTime _selectedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 10,
        child: Container(
          padding: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,  
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                autocorrect: true,
                decoration: InputDecoration(labelText: 'Title'),
                controller: _titleController,
                keyboardType: TextInputType.text,
                onSubmitted: (_) => _submitData(),
                //onChanged: (val) {
                //titleInput = val;
                //},
              ),
                    TextField(
                        decoration:InputDecoration(labelText:'Amount'),
                        controller: _amountController,
                        keyboardType: TextInputType.number,
                        onSubmitted: (_) =>  _submitData(),
                        //onChanged: (val) => amountInput = val,
                        ),
                        Container(
                          height:70,
                        child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      _selectedDate == null
                                    ? 'No Date Chosen'
                                    : 'Picked Date: ${DateFormat.yMd().format(_selectedDate!)}'),
                                  ),
                                  TextButton(
                                  child: Text('Choose a Date'),
                                  onPressed: _presentDatePicker,
                                  ),
                                ],
                              ),
                        ),
                      TextButton(
                        onPressed: _submitData,
                      child: Text('Add Transaction'),
                      style: TextButton.styleFrom(primary: Colors.indigo),
                        ),
                      ]
                    ),
                  ),
                ),
    );
  }
}