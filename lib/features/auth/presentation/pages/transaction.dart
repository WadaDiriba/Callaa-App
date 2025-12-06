import 'package:flutter/material.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: Text("Transaction history",
        
        style: TextStyle(

          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),),

        leading: Icon(Icons.history),
      ),

      body: Center(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
          
            children: [
          
               Text("You tranfered so many thing in this week",
               style: TextStyle(

                color: Colors.white,
               ),)
            ],
          ),
        ],
      ),
      ),
    );
  }
}