import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/trasaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);
 @override
  Widget build(BuildContext context) {
    return Container(
      height:400,
      child:transactions.isEmpty
      ? Column( 
          children:[
          Text('There is no Transactions',
          style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(
            height: 13
            ),
          Container(
            height: 350,
            child: Image.asset('assets/images/waiting.png',fit: BoxFit.cover)
            ),
          ],
        )
        : ListView.builder(
        itemBuilder: (ctx, index){
         return Card(
                    child:Row(
                      children: [
                       Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                          color: Theme.of(context).primaryColorDark,
                          width: 2,),
                        ),
                        padding:EdgeInsets.all(8),
                        child: Text(
                        style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                          '\$${transactions[index].amount.toStringAsFixed(2)}',
                        ),
                       ),
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text(
                        transactions[index].title,
                        style:Theme.of(context).textTheme.headline6,
                       ),
                        Text(
                        DateFormat.yMMMd().format(transactions[index].date),
                        style:TextStyle(
                        color:Colors.grey),
                        ) 
                       ],
                       )
                      ],
                    ),
                  );
        }, 
       itemCount: transactions.length,          
      ), 
       );
  }
}