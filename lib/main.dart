import './widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import './models/trasaction.dart';
import './widgets/transaction_list.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
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
  void _addNewTransaction(String txTitle,double txAmount){
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
        showBottomSheet(
          context: ctx,
          builder:(_){
          return NewTransaction(_addNewTransaction);
        },);
  }

    @override
  Widget build(BuildContext context) {
        return MaterialApp(
      debugShowCheckedModeBanner: false,
        home:Scaffold(
          appBar: AppBar( 
          backgroundColor: Colors.black87,
          title:Text('Notes Register'),
            actions: [
              IconButton(
                icon:Icon(Icons.add_circle_outline_sharp),
              onPressed:()=>
                 _startAddNewTransaction(context),
              ),
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
                    child: Text('Chart',
                    style: TextStyle(fontSize:15,
                      fontWeight: FontWeight.bold),
                      ),  
                   elevation: 9,
                  ),
                ), 
               TransactionList(_userTransactions),
              ],
            ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueGrey,
          child: Icon(Icons.add_circle_outline),
          onPressed: ()=>
            _startAddNewTransaction(context),
        ) ,
        ),
        );
  }
  }
