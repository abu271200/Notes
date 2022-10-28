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
      child:ListView.builder(
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
                          border: Border.all(color: Colors.purple,
                          width: 2,),
                        ),
                        padding:EdgeInsets.all(8),
                         child: Text(
                          '\$${transactions[index].amount.toStringAsFixed(1)}',
                        style:TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: 15,
                          color:Colors.purple,
                        ),
                       ),
                       ),
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text(
                        transactions[index].title,
                        style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold)
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