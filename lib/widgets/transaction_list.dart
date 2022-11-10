import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/trasaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  // this function is declered for delete trns;
  final Function deleteTx;
  TransactionList(this.transactions,this.deleteTx);
  //
 @override
  Widget build(BuildContext context) {
    return Container(
      height:600,
      child:transactions.isEmpty
      ? LayoutBuilder(builder: (ctx,constraints){
    return Column(
        children:[
      Text('There is no Transactions',
      style: Theme.of(context).textTheme.headline6,
      ),
      SizedBox(
        height: 20,
      ),
      Container(
        height: constraints.maxHeight * 0.7,
        child: Image.asset(
          'assets/images/waiting.png',
          fit: BoxFit.cover
        ),
      ),
     ],
    );
   })
        : ListView.builder(
        itemBuilder: (ctx, index){
         return Card(
          margin: EdgeInsets.all(8),
          elevation: 6,
           child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              child:Padding(padding: EdgeInsets.all(5),
              child: FittedBox(
              child: Text('\$${transactions[index].amount}'
              ),
             ),
            ),
           ),
           title: Text( 
            transactions[index].title,
            style:Theme.of(context).textTheme.headline6
            ),
            subtitle:Text(
             DateFormat.yMMMd().format(transactions[index].date),
             style:TextStyle(
              fontSize: 15,
             color:Colors.grey),
            ),
           trailing:
           IconButton(icon: Icon(Icons.delete),
           color: Theme.of(context).errorColor,
           onPressed:() => deleteTx(transactions[index].id),
              ) ,
           ),
         );
         }, 
       itemCount: transactions.length,          
      ), 
       );
  }
}