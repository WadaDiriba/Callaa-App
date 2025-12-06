import 'package:flutter/material.dart';

class BillPaymentsScreen extends StatelessWidget {
  
  const BillPaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bill Payments')),
      body: Center(child: Text('Bill Payments Functionality')),
    );
  }
}