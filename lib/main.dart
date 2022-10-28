import 'package:flutter/material.dart';
import './models/trasaction.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Asd',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePage();
}
class _MyHomePage extends State<MyHomePage> {
  final List<Transaction> _userTransactions=[
    Transaction(
      id:'t1',
      title: 'Loafer',
      amount: 25.6,
      date:DateTime.now()
    ),
    Transaction(
      id:'t2',
      title: 'Belt',
      amount: 12.8,
      date:DateTime.now()
    ),
  ];
  void _addNewTransaction(String txTitle, double txAmount){
    final newTx = Transaction(
    title: txTitle,
    amount: txAmount,
    date: DateTime.now(),
    id: DateTime.now().toString(),
    );
    setState(() {
       _userTransactions.add(newTx);
            });
  }
  //String title = 'titleInput';
      void _startAddNewTransaction(BuildContext ctx){
        showModalBottomSheet(
          context: ctx,
          builder:(_){
          return NewTransaction(_addNewTransaction);
        },);
  }

@override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
          backgroundColor: Colors.black87,
          title:Text('Notes Register'),
          actions: [
            IconButton(icon: Icon(Icons.add),
            onPressed: () =>
              _startAddNewTransaction(context),
            
            )
          ],
          ),
        body:SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: double.infinity,
                  child: Card(
                    color: Colors.brown,
                    child: Text('Chart'),
                      elevation: 9,
                      ),  
                   ), 
               TransactionList(_userTransactions),
              ],
            ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () =>
            _startAddNewTransaction(context),
        ),
        );
  }
  }
