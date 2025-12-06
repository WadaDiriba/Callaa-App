import 'package:callaa_app/features/auth/presentation/pages/Money_tranfer.dart';
import 'package:callaa_app/features/auth/presentation/pages/balance_screen.dart';
import 'package:callaa_app/features/auth/presentation/pages/bill_payemnt.dart';
import 'package:callaa_app/features/auth/presentation/pages/school_payment.dart';
import 'package:callaa_app/features/auth/presentation/pages/transaction.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
   HomePage({super.key});




  final List<FunctionItem> functions = [
  FunctionItem("Money Transfer", MoneyTransferScreen()),
  FunctionItem("Account Balance", AccountBalanceScreen()),
  FunctionItem("Transaction History", TransactionScreen()),
  FunctionItem("Bill Payments", BillPaymentsScreen()),

  FunctionItem("SchoolPayment",SchoolPayment()),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
         backgroundColor:Colors.black,

        centerTitle: true,

        title: Text("Chella Mobile App",
        
        
        style: TextStyle(
          color: Colors.yellow
        ),),
      ),

        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: functions.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => functions[index].screen),
                  );
                },
                child: Card(
            
                  color: Colors.amber,
                  elevation: 5,
                  child: Center(
                    child: Text(
            
                      functions[index].title,
                      style: TextStyle(fontSize: 16,
                      color: Colors.black,
                      
                      ),
                    ),
                  ),
                ),
              );
            },
                  ),
          ),
        ),
    );
  }
}


class FunctionItem {
  final String title;
  final Widget screen;

  FunctionItem(this.title,
   this.screen);
}

