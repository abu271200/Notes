import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './models/trasaction.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';

void main(){
  //This is for system display mode only for porrtrait mode//
  //SystemChrome.setPreferredOrientations([
  //DeviceOrientation.portraitUp,
  //DeviceOrientation.portraitDown
  //]);
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
        accentColor: Colors.purpleAccent,
        fontFamily: 'QuickSand',
        textTheme: ThemeData.light().textTheme.copyWith(headline6: TextStyle(fontFamily: 'OpenSans',fontWeight: FontWeight.bold,fontSize: 16)),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
              fontFamily: 'OpenSana',
              fontSize: 20,
              fontWeight: FontWeight.bold,),
              button: TextStyle(color: Colors.white),
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
   bool _showChart = false; 
  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx){
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }
  void _addNewTransaction(
  String txTitle, 
  double txAmount,
  DateTime chosenDate)
  {
    final newTx = Transaction(
    title: txTitle,
    amount: txAmount,
    date: chosenDate,
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
// this transaction for delete the string id;
void _deleteTransaction(String id){
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

@override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final islandscape = mediaQuery.orientation == Orientation.landscape;
    final appBar =  AppBar(
          backgroundColor: Colors.indigo,
          title:Text('Personal Expensive'),
          actions: [
            IconButton(icon: Icon(Icons.add),
            onPressed: () =>
              _startAddNewTransaction(context),
            ),
          ],
          );
          final txListWidget = Container(
            height:(mediaQuery.size.height - 
                appBar.preferredSize.height -
                mediaQuery.padding.top) * 0.7,
               child: TransactionList(_userTransactions, _deleteTransaction),
              );
        return Scaffold(
          appBar: appBar,
        body:SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
               // _islandscape ? an another format for add this we use if staement in list without curly braces.
               if (islandscape) Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    Text('Show Chart'),
                    Switch(
                      value: _showChart,
                      onChanged:(val){
                       setState(() {
                         _showChart = val;
                    });
                    },),
                    ],
                ),
                if (!islandscape) Container(
                 height:(mediaQuery.size.height - 
                appBar.preferredSize.height - 
                mediaQuery.padding.top) * 0.3,
                child:Chart(_recentTransactions),
                ),
                if (!islandscape) txListWidget,
               if (islandscape) _showChart 
                ? Container(
                 height:(mediaQuery.size.height - 
                appBar.preferredSize.height - 
                mediaQuery.padding.top) * 0.6,
                child:Chart(_recentTransactions),
                )
                :txListWidget,
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