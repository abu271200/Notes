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
      title: 'Personal Expansive',
      theme:ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.lime,
        fontFamily: 'QuickSand',
        textTheme: ThemeData.light().textTheme.copyWith(headline6: TextStyle(fontFamily: 'OpenSans',fontWeight: FontWeight.bold,fontSize: 16)),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
              fontFamily: 'OpenSana',
              fontSize: 20,
              fontWeight: FontWeight.bold,),
              )
              ),
      ),
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
   // Transaction(id: 't1', title: 'Loafer', amount: 25.6, date:DateTime.now(),),
    //Transaction(id: 't2', title: 'Belt', amount: 12.6, date:DateTime.now(),),
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
          return GestureDetector(
            onTap:() {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      }
    );
}

@override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
          backgroundColor: Colors.black87,
          title:Text('Personal Expensive'),
          actions: [
            IconButton(icon: Icon(Icons.add),
            onPressed: () =>
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
                    color: Colors.grey,
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