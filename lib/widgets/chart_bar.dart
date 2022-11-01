import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
 final String label;
 final double spendingAmount;
 final double spendingPtOfTotal;
 ChartBar(this.label,
          this.spendingAmount,
          this.spendingPtOfTotal);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('\$${spendingAmount.toStringAsFixed(0)}'),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                  color: Colors.grey,
                  width: 2.0),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}