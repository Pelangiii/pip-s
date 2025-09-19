import 'package:flutter/material.dart';

import 'package:tumbler/utils/consts.dart';

class BallanceCard extends StatelessWidget {
  const BallanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(defaultPadding),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xFF236A91),
        borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Row(
                  children: [
                    Icon(Icons.account_balance_wallet, color: Color(0xFF236A91)),
                SizedBox(width: 8),
                Text(
                  "Bottles",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                )
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  "Rp 145.000.000.000",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                )
                ],
              ),
            ),

          ),
          Expanded(
            child: Row(
              children: [
                _actionButtom(Icons.arrow_upward, "Pay"),
                _actionButtom(Icons.add_circle, "TopUp"),
                _actionButtom(Icons.explore, "Explore"),
              ],
            ),
          )
        ],
      ),
    );

  }

  Widget _actionButtom(IconData icon, String label){
    return Column(
      children: [
        Icon(icon, color: Colors.white,),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.white
          ),
        )

      ],
    );

  }
}